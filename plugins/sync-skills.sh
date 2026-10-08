#!/usr/bin/env bash
# Resync the second-brain plugin's skill copies from the canonical
# .claude/skills/ originals. Run this after editing any skill so the
# installed plugin picks up the change (then reinstall/reload the plugin).
#
# Usage:  bash plugins/sync-skills.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/.claude/skills"
DEST="$ROOT/plugins/second-brain/skills"

rm -rf "$DEST"
mkdir -p "$DEST"
# copy every skill folder, excluding any nested plugin metadata
rsync -a --delete --exclude '.claude-plugin' "$SRC"/ "$DEST"/

echo "Synced skills into plugin:"
ls -1 "$DEST"
