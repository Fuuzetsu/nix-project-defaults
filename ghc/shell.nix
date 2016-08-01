let pkgs = import <nixpkgs> {};
in pkgs.callPackage ./. { inherit (pkgs.haskell.packages.ghc784) ghc alex happy; }
