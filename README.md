# My Mac bootstrap + dotfiles

My dotfiles for my Mac.

It manages:

- Zsh config (oh-my-zsh + Powerlevel10k)
- Git config + global gitignore
- Warp config (keybindings + launch configs)
- Homebrew installs via a Brewfile

## Quick start (new Mac)

```sh
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply jonaspalms/my-bootstrap
```

If this opens an installer UI for Xcode Command Line Tools, just re-run the command once that finishes.

## First-time setup (this Mac → populate repo)

Re-import the files from your current machine (overwrites the `dot_*` files here):

```sh
./scripts/import-from-this-mac.sh
```

Optional: wipe the known dotfiles targets first (useful if you removed something):

```sh
./scripts/import-from-this-mac.sh --clean
```

## Notes on secrets (NordPass)

Don’t commit secrets (SSH keys, tokens, cloud creds, etc.). Store secrets in NordPass and see `docs/secrets.md`.

## If Powerlevel10k icons look broken

1) Ensure the Nerd Font is installed (it should be via the Brewfile).
2) Set your terminal font to **MesloLGS Nerd Font** (Terminal.app: Settings → Profiles → Text → Font).
