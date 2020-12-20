#!/usr/bin/env bash


nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

export NIX_PATH=$NIX_PATH:$HOME/.nix-defexpr/channels
nix-shell '<home-manager>' -A install

NIX_CONFIG_DIR=~/.config/nixpkgs
HOME_MGR_CFG_FILE=home.nix
HOME_MGR_CFG_PATH=$NIX_CONFIG_DIR/$HOME_MGR_CFG_FILE

# link home.nix if not already there
[[ -L "$HOME_MGR_CFG_PATH" ]] | ln -fs "$(pwd)/$HOME_MGR_CFG_FILE" "$HOME_MGR_CFG_PATH"

# enable environment
home-manager switch
