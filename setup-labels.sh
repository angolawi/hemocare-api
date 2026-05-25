#!/bin/bash
# Run once to create all HemoCare labels in your GitHub repo.
# Prerequisites: gh CLI installed and authenticated (gh auth login)

set -e

if [ ! -f hemocare.env ]; then
  echo "❌ hemocare.env not found. Create it with REPO, PROJECT_NUMBER, and PROJECT_OWNER."
  exit 1
fi
source ./hemocare.env

echo "Creating labels in $REPO..."

gh label create "user-story"       --color 0075ca --repo "$REPO" --force
gh label create "task"             --color e4e669 --repo "$REPO" --force
gh label create "layer:model"      --color d4c5f9 --repo "$REPO" --force
gh label create "layer:repository" --color bfd4f2 --repo "$REPO" --force
gh label create "layer:service"    --color c2e0c6 --repo "$REPO" --force
gh label create "layer:controller" --color f9d0c4 --repo "$REPO" --force
gh label create "layer:test"       --color fef2c0 --repo "$REPO" --force

echo "✅ Labels created in $REPO"
