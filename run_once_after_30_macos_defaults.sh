#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  exit 0
fi

echo "macOS defaults: not configured yet."
echo "Edit run_once_after_30_macos_defaults.sh to add defaults you want to enforce."

