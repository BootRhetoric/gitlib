let
  pkgs = import <nixpkgs> {};
  hlibgit2-src = pkgs.stdenv.mkDerivation {
    name = "hlibgit2-src";
    src = ./.;
    buildInputs = with pkgs; [
      cmake
      pkg-config
      python3
      zlib
      libssh2
      openssl
      pcre
      http-parser
      libiconv
    ];
    phases = [
      "unpackPhase"
      "configurePhase"
      "installPhase"
    ];
    configurePhase = ''
      cd libgit2
      cmake .
      cd ..
    '';
    installPhase = ''
      mkdir $out
      cp -r . $out
    '';
  };
in
  pkgs.haskellPackages.callCabal2nix "hlibgit2" hlibgit2-src {git = pkgs.git;}
