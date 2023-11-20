let
  pkgs = import <nixpkgs> {};
  hlibgit2-src = pkgs.stdenv.mkDerivation {
    name = "hlibgit2-src";
    src = ./.;
    phases = [
      "unpackPhase"
      "installPhase"
    ];
    installPhase = ''
      mkdir $out
      cp -r . $out
      rm -rf $out/build
      ln -s ${import ./libgit.nix} $out/build
    '';
  };
in
  pkgs.haskellPackages.callCabal2nix "hlibgit2" hlibgit2-src {git = pkgs.git;}
