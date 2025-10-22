#!/usr/bin/env bash
set -euo pipefail

FILE_NAME=".tmux.conf"
CONFIG_DIR="$HOME"
CONFIG_PATH="$CONFIG_DIR/$FILE_NAME"
BACKUP_PATH="$CONFIG_PATH.bak"

echo "[*] Uninstalling tmux-config..."

if [ -L "$CONFIG_PATH" ]; then
    echo "[!] Removing symlink at $CONFIG_PATH"
    rm "$CONFIG_PATH"
else
    echo "[!] No symlink found at $CONFIG_PATH — skipping"
fi

if [ -d "$BACKUP_PATH" ]; then
    echo "[!] Restoring backup from $BACKUP_PATH"
    mv "$BACKUP_PATH" "$CONFIG_PATH"
    echo "[✓] Backup restored."
else
    echo "[i] No backup found. Nothing to restore."
fi

echo "[✓] Uninstall complete."

