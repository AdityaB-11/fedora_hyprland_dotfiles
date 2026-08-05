#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"

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

HOME_FILES=(
  .bashrc
)

mkdir -p "$CONFIG_DIR"
mkdir -p "$BACKUP_DIR"

echo "Backing up existing configs..."

# Backup config directories
for item in "${CONFIGS[@]}"; do
  if [ -e "$CONFIG_DIR/$item" ]; then
    mv "$CONFIG_DIR/$item" "$BACKUP_DIR/"
  fi
done

# Backup config files
for item in "${FILES[@]}"; do
  if [ -e "$CONFIG_DIR/$item" ]; then
    mv "$CONFIG_DIR/$item" "$BACKUP_DIR/"
  fi
done

# Backup home files
for item in "${HOME_FILES[@]}"; do
  if [ -e "$HOME/$item" ]; then
    mv "$HOME/$item" "$BACKUP_DIR/"
  fi
done

echo "Installing dotfiles..."

# Copy config directories
for item in "${CONFIGS[@]}"; do
  if [ -e "$DOTFILES_DIR/$item" ]; then
    cp -a "$DOTFILES_DIR/$item" "$CONFIG_DIR/"
    echo "✓ $item"
  fi
done

# Copy config files
for item in "${FILES[@]}"; do
  if [ -e "$DOTFILES_DIR/$item" ]; then
    cp -a "$DOTFILES_DIR/$item" "$CONFIG_DIR/"
    echo "✓ $item"
  fi
done

# Copy home files
for item in "${HOME_FILES[@]}"; do
  if [ -e "$DOTFILES_DIR/$item" ]; then
    cp -a "$DOTFILES_DIR/$item" "$HOME/"
    echo "✓ $item"
  fi
done

echo
echo "Installation complete!"
echo "Backup stored in:"
echo "  $BACKUP_DIR"
