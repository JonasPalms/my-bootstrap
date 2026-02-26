#!/usr/bin/env bash
set -euo pipefail

if [[ -d "$HOME/.oh-my-zsh" ]]; then
  exit 0
fi

if ! command -v git >/dev/null 2>&1; then
  echo "git not found. Install Xcode Command Line Tools and re-run: chezmoi apply" >&2
  exit 1
fi

echo "Installing oh-my-zsh..."
export RUNZSH=no
export CHSH=no
export KEEP_ZSHRC=yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
