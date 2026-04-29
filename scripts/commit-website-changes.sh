#!/bin/bash

git config user.name "github-actions"
git config user.email "github-actions@github.com"

git add wiki/

if git diff --cached --quiet; then
  echo "No changes to commit"
  exit 0
fi

git commit -m "Update enchantments website"
git push
