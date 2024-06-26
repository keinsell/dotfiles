# Home Manager

## Installation

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

```bash
# Install Nix
curl --proto '=https' --tlsv1.2 -sSf -L \
  https://install.determinate.systems/nix | sh -s -- install
# TODO: Enable flakes
# TODO: Install Home Manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
# TODO: Install home manager
home-manager switch -f ~/Projects/dotfiles/home/home.nix
nh home switch ~/Projects/dotfiles/home
```

## Setup Node.js

```bash
npm set prefix ~/.cache/npm
pnpm set store-dir ~/.cache/pnpm
mkdir -p  ~/.local/bin/corepack && corepack enable --install-directory ~/.local/bin/corepack
```