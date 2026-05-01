package com.explorerseden.wikirenderer;

import com.google.gson.*;
import net.fabricmc.api.ClientModInitializer;
import net.minecraft.client.Minecraft;
import net.minecraft.client.Screenshot;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;

import java.io.File;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.concurrent.atomic.AtomicBoolean;

public class WikiRendererClient implements ClientModInitializer {
    private static final AtomicBoolean STARTED = new AtomicBoolean(false);

    @Override
    public void onInitializeClient() {
        if (!Boolean.getBoolean("wiki.render")) return;

        Thread worker = new Thread(this::runRenderer, "wiki-renderer-worker");
        worker.setDaemon(true);
        worker.start();
    }

    private void runRenderer() {
        try {
            Minecraft client = Minecraft.getInstance();

            waitForWorld(client);
            sleep(4000);

            MinecraftServer server = client.getSingleplayerServer();
            if (server == null) throw new IllegalStateException("No integrated server available.");

            Path manifestPath = Path.of(System.getProperty("wiki.manifest"));
            Path outputRoot = Path.of(System.getProperty("wiki.output"));

            JsonObject manifest;
            try (FileReader reader = new FileReader(manifestPath.toFile())) {
                manifest = JsonParser.parseReader(reader).getAsJsonObject();
            }

            JsonArray groups = manifest.getAsJsonArray("groups");
            System.out.println("[WikiRenderer] Rendering " + groups.size() + " structure group(s).");

            int groupIndex = 0;
            for (JsonElement groupElement : groups) {
                JsonObject group = groupElement.getAsJsonObject();
                String namespace = group.get("namespace").getAsString();
                String outputName = group.get("outputName").getAsString();

                Path outputPath = outputRoot.resolve(namespace).resolve(outputName + ".png");
                Files.createDirectories(outputPath.getParent());

                renderGroup(client, server, group, outputPath, groupIndex);
                groupIndex++;
            }

            sleep(1000);
            client.execute(client::stop);
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            Minecraft.getInstance().execute(() -> Minecraft.getInstance().stop());
            System.exit(1);
        }
    }

    private void waitForWorld(Minecraft client) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 180_000L;

        while (System.currentTimeMillis() < deadline) {
            if (client.level != null && client.player != null && client.getSingleplayerServer() != null) {
                return;
            }

            sleep(500);
        }

        throw new IllegalStateException("Timed out waiting for singleplayer world to load.");
    }

    private void renderGroup(Minecraft client, MinecraftServer server, JsonObject group, Path outputPath, int index) throws Exception {
        int baseX = 0;
        int baseY = 80;
        int baseZ = index * 256;
        int cursorX = baseX;

        CommandSourceStack source = server.createCommandSourceStack().withSuppressedOutput();

        runCommand(server, source, "fill " + (baseX - 16) + " " + (baseY - 16) + " " + (baseZ - 96) + " " + (baseX + 512) + " " + (baseY + 160) + " " + (baseZ + 96) + " minecraft:air");

        JsonArray pieces = group.getAsJsonArray("pieces");

        int maxHeight = 24;
        int totalWidth = 0;

        for (JsonElement pieceElement : pieces) {
            JsonObject piece = pieceElement.getAsJsonObject();
            String location = piece.get("location").getAsString();
            JsonArray size = piece.getAsJsonArray("size");

            int sx = size.get(0).getAsInt();
            int sy = size.get(1).getAsInt();

            runCommand(server, source, "place template " + location + " " + cursorX + " " + baseY + " " + baseZ);

            cursorX += Math.max(sx, 1) + 4;
            totalWidth += Math.max(sx, 1) + 4;
            maxHeight = Math.max(maxHeight, sy);
            sleep(250);
        }

        int centerX = baseX + Math.max(totalWidth / 2, 8);
        int centerY = baseY + Math.max(maxHeight / 2, 8);
        int centerZ = baseZ;

        final double cameraX = centerX + Math.max(totalWidth, 48) * 0.65;
        final double cameraY = centerY + Math.max(maxHeight, 24) * 0.75;
        final double cameraZ = centerZ + Math.max(totalWidth, 48) * 0.65;
        final float cameraYaw = 135.0f;
        final float cameraPitch = 28.0f;

        client.execute(() -> {
            if (client.player != null) {
                client.player.setPos(cameraX, cameraY, cameraZ);
                client.player.setYRot(cameraYaw);
                client.player.setXRot(cameraPitch);
            }

            client.options.hideGui = true;
        });

        sleep(4000);

        File screenshotDir = outputPath.getParent().toFile();
        String fileName = outputPath.getFileName().toString();

        client.execute(() -> Screenshot.grab(
            screenshotDir,
            fileName,
            client.getMainRenderTarget(),
            1,
            (Component message) -> System.out.println("[WikiRenderer] " + message.getString())
        ));

        sleep(2500);

        if (!Files.exists(outputPath)) {
            throw new IllegalStateException("Screenshot was not created: " + outputPath);
        }

        System.out.println("[WikiRenderer] Generated " + outputPath);
    }

    private void runCommand(MinecraftServer server, CommandSourceStack source, String command) {
        server.execute(() -> {
            try {
                server.getCommands().performPrefixedCommand(source, command);
            } catch (Throwable throwable) {
                System.err.println("[WikiRenderer] Command failed: /" + command);
                throwable.printStackTrace();
            }
        });
    }

    private void sleep(long ms) throws InterruptedException {
        Thread.sleep(ms);
    }
}
