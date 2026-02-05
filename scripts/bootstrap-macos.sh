#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This bootstrap script is for macOS (Darwin) only." >&2
  exit 1
fi

REPO="${1:-${DOTFILES_REPO:-}}"
if [[ -z "${REPO}" ]]; then
  echo "Usage: $0 <github-user>/<repo>" >&2
  echo "Or set DOTFILES_REPO env var." >&2
  exit 2
fi

if ! xcode-select -p >/dev/null 2>&1; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install || true
  echo "Finish the Xcode CLT installer UI, then re-run this script."
  exit 0
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
fi

echo "Installing chezmoi..."
brew install chezmoi

echo "Applying dotfiles from ${REPO}..."
chezmoi init --apply "https://github.com/${REPO}.git"

echo
echo "Done. Open a new terminal session (Warp) to pick up changes."

