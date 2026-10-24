#!/usr/bin/env bash
# Pull the latest default branch of every fork in ui-kit/ and show what moved.
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"

git submodule sync --quiet
git submodule update --init --quiet
before=$(git submodule status)
git submodule update --remote --merge
after=$(git submodule status)

if [ "$before" = "$after" ]; then
  echo "ui-kit is already up to date."
else
  echo "Updated:"
  diff <(echo "$before") <(echo "$after") | grep '^>' | sed 's/^> */  /' || true
  echo
  echo "Commit the new pins with: git commit -am 'Update ui-kit'"
fi
