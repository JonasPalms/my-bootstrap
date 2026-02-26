#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/import-from-this-mac.sh [--clean]

Options:
  --clean  Clean destination before importing (safe: only removes known dot_* targets).
EOF
}

DEST_BASE="$ROOT"
CLEAN=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --clean) CLEAN=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown arg: $1" >&2; usage; exit 2 ;;
  esac
done

safe_clean_root_targets() {
  rm -f \
    "$ROOT/dot_zshrc" \
    "$ROOT/dot_zprofile" \
    "$ROOT/dot_gitconfig" \
    "$ROOT/dot_gitignore_global"
  rm -rf "$ROOT/dot_warp"
}

if $CLEAN; then
  safe_clean_root_targets
fi

copy_file() {
  local src="$1"
  local dest="$2"
  if [[ -f "$src" ]]; then
    mkdir -p "$(dirname "$dest")"
    cp -f "$src" "$dest"
    echo "Imported: $src -> $dest"
  fi
}

copy_dir() {
  local src="$1"
  local dest="$2"
  if [[ -d "$src" ]]; then
    mkdir -p "$dest"
    rsync -a --delete --exclude '.DS_Store' "$src"/ "$dest"/
    echo "Imported: $src/ -> $dest/"
  fi
}

echo "Importing selected dotfiles from this Mac..."
echo "Repo: $ROOT"
echo "Destination: $DEST_BASE"
echo

copy_file "$HOME/.zshrc" "$DEST_BASE/dot_zshrc"
copy_file "$HOME/.zprofile" "$DEST_BASE/dot_zprofile"
copy_file "$HOME/.gitconfig" "$DEST_BASE/dot_gitconfig"
copy_file "$HOME/.gitignore_global" "$DEST_BASE/dot_gitignore_global"

copy_file "$HOME/.warp/keybindings.yaml" "$DEST_BASE/dot_warp/keybindings.yaml"
copy_dir "$HOME/.warp/launch_configurations" "$DEST_BASE/dot_warp/launch_configurations"

echo
echo "Imported into the repo root. Next: review + commit/push."
