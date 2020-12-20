{ config, pkgs, ... }:

{

    programs.neovim = {
      viAlias = true;
      vimAlias = true;
      extraConfig = builtins.readFile ./extraConfig.vim;

      plugins =  import ./plugins.nix { inherit pkgs; };
    };
}
