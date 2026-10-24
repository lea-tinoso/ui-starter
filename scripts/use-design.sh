#!/usr/bin/env bash
# Copy a DESIGN.md from ui-kit/awesome-design-md into the project root.
# Usage: scripts/use-design.sh <name>   (no name lists the choices)
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
dir=ui-kit/awesome-design-md/design-md

if [ ! -d "$dir" ]; then
  echo "ui-kit is empty. Run: git submodule update --init" >&2
  exit 1
fi
if [ $# -eq 0 ]; then
  ls "$dir" | column
  exit 0
fi
if [ ! -f "$dir/$1/DESIGN.md" ]; then
  echo "No design named '$1'. Run without arguments to list them." >&2
  exit 1
fi

cp "$dir/$1/DESIGN.md" DESIGN.md
echo "DESIGN.md is now '$1'. Next: map its tokens into the @theme block in src/index.css."
