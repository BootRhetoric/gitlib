let
  pkgs = import <nixpkgs> {};
  c2hsc = pkgs.haskellPackages.callCabal2nix "c2hsc" (builtins.fetchGit {url = "https://github.com/jwiegley/c2hsc.git";}) {};
in
  pkgs.mkShell {
    packages =
      [
        c2hsc
      ]
      ++ (with pkgs; [
        cmake
        pkg-config
        python3
        zlib
        libssh2
        openssl
        pcre
        http-parser
        libiconv
      ]);
  }
