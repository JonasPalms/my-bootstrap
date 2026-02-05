#!/usr/bin/env bash
set -euo pipefail

BREWFILE="${1:-$HOME/.Brewfile}"

if ! command -v brew >/dev/null 2>&1; then
  echo "brew not found." >&2
  exit 1
fi

echo "Writing Brewfile to: $BREWFILE"
brew bundle dump --describe --force --file "$BREWFILE"

echo "Done. Copy it into this repo as dot_Brewfile."

