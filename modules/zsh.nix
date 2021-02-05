{ config, pkgs, ... }:

let

in
{
  programs.zsh = {
    initExtraBeforeCompInit = ''
      ENABLE_ASDF=true
      # asdf
      if [[ $ENABLE_ASDF && -f "$HOME/.asdf/asdf.sh" ]]; then
        echo "ASDF: Enabled"
        . "$HOME/.asdf/asdf.sh"
      fi
      # append completions to fpath
      fpath=($ASDF_DIR/completions $fpath)
    '';
    initExtra = ''
#        # for single user mode
#        DIR=~/.nix-profile/etc/profile.d
#        [[ -f "$DIR/nix.sh" ]] && . "$DIR/nix.sh"
#        [[ -f "$DIR/hm-session-vars.sh" ]] && . "$DIR/hm-session-vars.sh"
        eval $(dircolors ~/.nix-profile/share/LS_COLORS)
    '';

    defaultKeymap = "emacs";
  };

}
