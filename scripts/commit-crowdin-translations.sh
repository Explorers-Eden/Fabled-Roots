#!/usr/bin/env bash
set -euo pipefail

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

git add assets/fabled_roots/lang
git restore --staged assets/fabled_roots/lang/en_us.json || true

if git diff --cached --quiet; then
  echo "No translation changes to commit"
else
  git commit -m "Update Fabled Roots translations from Crowdin"
  git push origin HEAD:"${BRANCH_NAME}"
fi
