let pkgs = import <nixpkgs> {};
    packageSet = pkgs.haddock_packages pkgs.haskell.packages.ghcHEAD;
in packageSet.callPackage ./. {}
