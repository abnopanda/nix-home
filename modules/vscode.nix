{ config, pkgs, ... }:

let

in
{
  programs.vscode = {
    package = pkgs.vscodium;
#    extensions = let
#    in with pkgs.misc.vscode-extensions; [
#      gitlens
#      dracula-theme
#      indent-rainbow
#    ];
    userSettings = {
      "workbench.colorTheme" = "Dracula";
      editor = {
        formatOnSave = true;
  #      rulers = [120];
  #      minimap.enabled = false;
  #      tabSize = 2;
        insertSpaces = true;

      };
      "editor.fontFamily" = "'Hasklug Nerd Font Mono', 'monospace', monospace";
#      "editor.fontSize" = 18;
#      "terminal.integrated.fontSize" = 18;
#      "debug.console.fontSize" = 18;
       explorer.confirmDelete = false;
#      window = {
#        menuBarVisibility = "toggle";
#        zoomLevel = -1;
#      };
    };
  };

}
