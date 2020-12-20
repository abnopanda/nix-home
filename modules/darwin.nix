{ config, pkgs, ... }:


let
  ls-colors = pkgs.stdenv.mkDerivation {
    name = "ls-colors";
    src = fetchGit{
      url = "https://github.com/trapd00r/LS_COLORS";
      ref = "master";
    };
    installPhase = ''
      mkdir -p $out/bin $out/share
      ln -s ${pkgs.coreutils}/bin/ls $out/bin/ls
      ln -s ${pkgs.coreutils}/bin/dircolors $out/bin/dircolors
      cp LS_COLORS $out/share/LS_COLORS
    '';
  };
in {

  home.packages = [ ls-colors ];

}
