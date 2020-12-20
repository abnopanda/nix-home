{ config, pkgs, ... }:

let
   shellAliases = {
     ls = "ls --color=auto -F";
     lla = "ls -ltra";
     ll = "ls -ltr";
     hms = "home-manager switch";
     hmg = "home-manager generations";
     nelg = "nix-env --list-generations";
     nix-clean = "nix-collect-garbage -d";
   };
in
{

  imports = [
    ./vscode.nix
    ./zsh.nix
    ./fish.nix
    ./nvim
    ./git
  ];

  home = {
    sessionVariables = {
      NIX_PATH = "$NIX_PATH:$HOME/.nix-defexpr/channels";
      EDITOR = "vim";
      VISUAL = "$EDITOR";
    };
    packages = [ pkgs.tree ];
  };

  programs.direnv.enable = true;
  programs.direnv.enableNixDirenvIntegration = true;

  programs.bat.enable = true;
  programs.neovim.enable = true;
  programs.vscode.enable = true;
  programs.git.enable = true;
  programs.zsh = {
    enable = true;
    shellAliases = shellAliases;
  };
  programs.fish = {
    enable = true;
    shellAliases = shellAliases;
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
