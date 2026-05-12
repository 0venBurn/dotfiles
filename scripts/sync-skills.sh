#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/.pi/skills"

for target in "$ROOT/.claude/skills" "$ROOT/.opencode/skills"; do
  mkdir -p "$target"
  rsync -a --delete "$SRC/" "$target/"
done

echo "Skills synced from .pi -> .claude/.opencode"
