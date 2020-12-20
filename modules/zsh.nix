{ config, pkgs, ... }:

let

in
{
  programs.zsh = {
    initExtra = ''
#        # for single user mode
#        DIR=~/.nix-profile/etc/profile.d
#        [[ -f "$DIR/nix.sh" ]] && . "$DIR/nix.sh"
#        [[ -f "$DIR/hm-session-vars.sh" ]] && . "$DIR/hm-session-vars.sh"
        eval $(dircolors ~/.nix-profile/share/LS_COLORS)
    '';
#    prezto = {
#      enable = true;
#      prompt = {
#        theme = "steeef";
#      };
#      utility.safeOps = false;
#    };
  };

}
