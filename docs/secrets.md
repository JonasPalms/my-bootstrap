# Secrets and identity

## What should never go in git

- `~/.ssh/*` private keys
- API tokens, `.env*`, cloud credentials (`~/.aws`, `~/.azure`, etc.)
- Personal certificates, signing keys (GPG), password manager exports

## SSH keys (recommended approach)

- Create keys per-machine (`ssh-keygen -t ed25519`)
- Use a strong passphrase and store it in NordPass
- Add the public key to GitHub (and any other providers)

## Encrypted dotfiles (optional, later)

If you want to store a small number of sensitive config files in this repo, use `chezmoi` encryption with `age`.

