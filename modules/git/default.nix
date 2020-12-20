{ config, pkgs, lib, ...}:

with pkgs;

let
  emptyPkg = stdenv.mkDerivation rec {
    # NOTE Empty package to force home-manager to use the system git
    # package. On macOS this provides a nice integration with the
    # KeyChain which the OS variant does not provide.
    name = "empty";
    unpackPhase = "true";
    installPhase = ''
        mkdir -p $out/share/empty
        touch $out/share/empty/empty
      '';
    meta = {
      description = "An empty package to force home-manager to use the system package";
    };
  };
in {

  programs.git = {
    # NOTE Use the empty package to use the system provided git/ssh package
    # because on Darwin this support the UseKeychain setting.
    package = if stdenv.isDarwin then emptyPkg else git;

    delta.enable = true;

    aliases = {
      amend = "!git log -n 1 --pretty=tformat:%s%n%n%b | git commit -F - --amend";
      g = "grep";
      d = "diff";
      oneline = "log --pretty=oneline";
      l = "log --graph --decorate --pretty=oneline --abbrev-commit";
      lol = "log --graph --decorate --pretty=oneline --abbrev-commit";
      lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
      glog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'";
      stash-all = "stash save --include-untracked";
      prune = "fetch --prune";
      s = "status";
    };

    extraConfig = {
      status = {
        showUntrackedFiles = "all";
      };
      color = {
        ui = "true";
        branch = "auto";
        diff = "auto";
        interactive = "auto";
        state = "auto";
      };
      core = {
        autocrlf = "input";
      };
      merge = {
        ff = "only";
        conflictstyle = "diff3";
      };
      push = {
        default = "simple";
      };
      pull = {
        ff = "only";
      };
#      delta = {
#        features = "side-by-side line-numbers decorations";
#      };
    };

    ignores = import ./gitignore.nix { };
  };
}
