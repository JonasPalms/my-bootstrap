#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  exit 0
fi

if xcode-select -p >/dev/null 2>&1; then
  exit 0
fi

echo "Xcode Command Line Tools are required for Homebrew and git."
echo "Opening the installer UI now..."
xcode-select --install || true
echo "After installation completes, re-run: chezmoi apply"
exit 1

