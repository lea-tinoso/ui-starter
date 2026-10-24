#!/usr/bin/env bash
# Run the taste-skill inspector with this project's settings.
# Usage: scripts/inspect.sh <url | file.html> [inspector flags]
#   - As root (cloud sessions), Chrome runs through chrome-no-sandbox.sh.
#   - Rules listed in .design-allow (one comma-separated line) are passed as --allow,
#     for traits the picked style calls for (e.g. hard shadows in neo-brutalism).
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"

if [ -z "${CHROME_PATH:-}" ] && [ "$(id -u)" = 0 ]; then
  export CHROME_PATH="$PWD/scripts/chrome-no-sandbox.sh"
fi

args=("$@")
if [ -f .design-allow ]; then
  allow=$(tr -d ' \n' < .design-allow)
  [ -n "$allow" ] && args+=(--allow "$allow")
fi

exec node .claude/skills/design-taste-frontend/scripts/inspect.mjs "${args[@]}"
