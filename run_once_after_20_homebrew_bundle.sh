#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  exit 0
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found; skipping Brewfile install."
  exit 0
fi

BREWFILE="$HOME/.Brewfile"
if [[ ! -f "$BREWFILE" ]]; then
  echo "No $BREWFILE found; skipping brew bundle."
  exit 0
fi

echo "Installing Homebrew packages from $BREWFILE..."
brew bundle --file "$BREWFILE"

