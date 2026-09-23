$dialog show @s \
{\
  "type":"minecraft:confirmation",\
  "body":[\
    {\
      "type":"minecraft:item",\
      "item":{\
        "id":"minecraft:command_block",\
        "components":{\
          "minecraft:tooltip_display":{\
            "hide_tooltip":true\
          }\
        }\
      },\
      "description":{\
        "translate":"menu.fabled_roots.config.description",\
        "fallback":"Configure Miscellaneous Settings:"\
      }\
    }\
  ],\
  "inputs":[\
    {\
      "type":"minecraft:single_option",\
      "key":"pvp",\
      "width": 256,\
      "label":{\
        "translate":"option.fabled_roots.config.pvp",\
        "fallback":"Same Race PVP"\
      },\
      "options":[\
        {\
          "id":"enabled",\
          "display":{\
            "translate":"option.fabled_roots.enabled",\
            "fallback":"Enabled",\
            "color":"green"\
          }\
        },\
        {\
          "id":"disabled",\
          "display":{\
            "translate":"option.fabled_roots.disabled",\
            "fallback":"Disabled",\
            "color":"red"\
          },\
          "initial":$(pvp_initial)\
        }\
      ]\
    },\
    {\
      "type":"minecraft:single_option",\
      "key":"prefix",\
      "width": 256,\
      "label":{\
        "translate":"option.fabled_roots.config.prefix",\
        "fallback":"Race Prefixes"\
      },\
      "options":[\
        {\
          "id":"enabled",\
          "display":{\
            "translate":"option.fabled_roots.enabled",\
            "fallback":"Enabled",\
            "color":"green"\
          }\
        },\
        {\
          "id":"disabled",\
          "display":{\
            "translate":"option.fabled_roots.disabled",\
            "fallback":"Disabled",\
            "color":"red"\
          },\
          "initial":$(prefix_initial)\
        }\
      ]\
    },\
    {\
      "type":"minecraft:single_option",\
      "key":"seeinvis",\
      "width": 256,\
      "label":{\
        "translate":"option.fabled_roots.config.seeinvis",\
        "fallback":"See Same Race Invisible Players"\
      },\
      "options":[\
        {\
          "id":"enabled",\
          "display":{\
            "translate":"option.fabled_roots.enabled",\
            "fallback":"Enabled",\
            "color":"green"\
          }\
        },\
        {\
          "id":"disabled",\
          "display":{\
            "translate":"option.fabled_roots.disabled",\
            "fallback":"Disabled",\
            "color":"red"\
          },\
          "initial":$(seeinvis_initial)\
        }\
      ]\
    },\
    {\
      "type":"minecraft:single_option",\
      "key":"npc_spawning",\
      "width": 256,\
      "label":{\
        "translate":"option.fabled_roots.config.npc_spawning",\
        "fallback":"Descendant Spawning"\
      },\
      "options":[\
        {\
          "id":"enabled",\
          "display":{\
            "translate":"option.fabled_roots.enabled",\
            "fallback":"Enabled",\
            "color":"green"\
          }\
        },\
        {\
          "id":"disabled",\
          "display":{\
            "translate":"option.fabled_roots.disabled",\
            "fallback":"Disabled",\
            "color":"red"\
          },\
          "initial":$(npc_spawning_initial)\
        }\
      ]\
    },\
    {\
      "type":"minecraft:single_option",\
      "key":"starter_equip",\
      "width": 256,\
      "label":{\
        "translate":"option.fabled_roots.config.starter_equip",\
        "fallback":"Starting Class Equipment"\
      },\
      "options":[\
        {\
          "id":"always",\
          "display":{\
            "translate":"option.fabled_roots.starter_equip.always",\
            "fallback":"Always"\
          }\
        },\
        {\
          "id":"once",\
          "display":{\
            "translate":"option.fabled_roots.starter_equip.once",\
            "fallback":"Once"\
          },\
          "initial":$(starter_equip_initial)\
        }\
      ]\
    }\
  ],\
  "can_close_with_escape":true,\
  "pause":true,\
  "after_action":"close",\
  "external_title":{\
    "translate":"menu.fabled_roots.config.title",\
    "fallback":"Config Menu"\
  },\
  "title":{\
    "translate":"menu.fabled_roots.config.title",\
    "fallback":"Config Menu"\
  },\
  "yes":{\
    "label":{\
      "translate":"menu.fabled_roots.confirm",\
      "fallback":"Confirm"\
    },\
    "action":{\
      "type":"minecraft:dynamic/run_command",\
      "template":"$(command_template)"\
    }\
  },\
  "no": {\
    "label": {\
      "translate": "menu.fabled_roots.back",\
      "fallback":"Back"\
    },\
    "action": {\
      "type": "show_dialog",\
      "dialog": "fabled_roots:admin"\
    }\
  }\
}