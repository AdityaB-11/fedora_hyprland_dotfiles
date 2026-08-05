#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

HOME_FILES=(
  .bashrc
)
CONFIGS=(
  hypr
  fuzzel
  alacritty
  wayle
  gtk-3.0
  gtk-4.0
  wal
)

FILES=(
  gtkrc
  gtkrc-2.0
  hyfetch.json
  mimeapps.list
)

echo "Updating dotfiles..."

for item in "${HOME_FILES[@]}"; do
  if [ -e "$HOME/$item" ]; then
    cp -af "$HOME/$item" "$DOTFILES_DIR/"
    echo "✓ $item"
  fi
done

for item in "${CONFIGS[@]}"; do
  if [ -e "$CONFIG_DIR/$item" ]; then
    rm -rf "$DOTFILES_DIR/$item"
    cp -a "$CONFIG_DIR/$item" "$DOTFILES_DIR/"
    echo "✓ $item"
  fi
done

for item in "${FILES[@]}"; do
  if [ -e "$CONFIG_DIR/$item" ]; then
    cp -af "$CONFIG_DIR/$item" "$DOTFILES_DIR/"
    echo "✓ $item"
  fi
done

echo
echo "Dotfiles updated!"
