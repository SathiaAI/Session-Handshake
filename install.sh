#!/usr/bin/env bash
# Session Handshake — convenience installer
# Usage:  ./install.sh [claude|cursor|codex]   (default: claude)
set -euo pipefail

TARGET="${1:-claude}"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$TARGET" in
  claude)
    DEST="${HOME}/.claude/skills/session-handshake"
    mkdir -p "$DEST"
    cp -r "${REPO_ROOT}/skills/session-handshake/." "$DEST/"
    echo "✅ Installed Claude skill -> $DEST"
    echo "   Trigger it by saying: \"run the session handshake\""
    ;;
  cursor)
    DEST=".cursor/rules"
    mkdir -p "$DEST"
    # Strips the markdown code fences from clients/cursor.md Option A and writes the rule.
    echo "ℹ️  Open clients/cursor.md and copy the .mdc block into ${DEST}/session-handshake.mdc"
    echo "   (kept manual on purpose so you place it in the RIGHT project)"
    ;;
  codex)
    echo "ℹ️  Open clients/codex-agents.md and paste the section into your project's AGENTS.md"
    ;;
  *)
    echo "Unknown target: $TARGET  (use: claude | cursor | codex)"; exit 1
    ;;
esac
