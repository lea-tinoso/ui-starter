#!/usr/bin/env bash
# Chrome wrapper for the taste-skill inspector when running as root (cloud sessions):
# Chrome refuses to start as root unless the sandbox is off.
set -euo pipefail
for exe in "${CHROME_REAL:-}" /opt/pw-browsers/chromium /usr/bin/google-chrome /usr/bin/chromium /usr/bin/chromium-browser; do
  if [ -n "$exe" ] && [ -x "$exe" ]; then
    exec "$exe" --no-sandbox "$@"
  fi
done
echo "No Chrome found. Set CHROME_REAL to its executable." >&2
exit 1
