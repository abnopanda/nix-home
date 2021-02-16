{ config, pkgs, ... }:

let
  username = builtins.getEnv "USER";
  homedir = builtins.getEnv "HOME";
in
{

  imports = [
    ./modules/common.nix
    ./modules/darwin.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "${username}";
  home.homeDirectory = "${homedir}";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  programs.git.userName  = "abnopanda";
  programs.git.userEmail = "abnopanda@gmail.com";

  home.file.".hammerspoon".source = modules/hammerspoon/config;

  # Allow non-free (as in beer) packages
  nixpkgs.config = {
    allowUnfree = true;
    # allowUnsupportedSystem = true;
  };
}
