# macOS bootstrap + dotfiles

This repo is meant to get a new Mac to a usable dev environment quickly.

- Manage dotfiles with `chezmoi` (zsh, git, Warp)
- Install CLI/apps via Homebrew `Brewfile`
- Optionally apply macOS defaults

## Quick start (new Mac)

Option A (recommended): apply from GitHub using chezmoi’s installer:

```sh
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply <github-user>
```

Option B: clone this repo and run the bootstrap script:

```sh
git clone https://github.com/<github-user>/<repo>.git
cd <repo>
./scripts/bootstrap-macos.sh <github-user>/<repo>
```

## First-time setup (this Mac → populate repo)

Import/overwrite the repo’s `dot_*` files from your machine:

```sh
./scripts/import-from-this-mac.sh
```

Optional (starts from a clean slate for the known dotfiles targets):

```sh
./scripts/import-from-this-mac.sh --clean
```

## Notes on secrets (NordPass)

Don’t commit secrets (SSH keys, tokens, cloud creds, etc.). See `docs/secrets.md`.
