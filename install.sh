#!/usr/bin/env bash
set -euo pipefail

echo "[*] Setting up tmux config..."

FILE_NAME=".tmux.conf" 
CONFIG_DIR="$HOME"
CONFIG_PATH="$CONFIG_DIR/$FILE_NAME"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_PATH="$REPO_DIR/$FILE_NAME"

if [[ "$CONFIG_DIR" == "$REPO_DIR" ]]; then
    echo "Already done."
    exit 0
fi

if [ -e "$CONFIG_PATH" ]; then
    echo "[!] Backing up existing config to ${CONFIG_PATH}.bak"
    mv "$CONFIG_PATH" "${CONFIG_PATH}.bak"
fi

ln -sfn "$REPO_PATH" "$CONFIG_PATH"

echo "[✓] Symlink created: $CONFIG_PATH → $REPO_PATH"
echo "tmux instalation completed."

