let pkgs = import <nixpkgs> {};
    packageSet = pkgs.hspec_packages pkgs.haskell.packages.ghcHEAD;
in packageSet.callPackage ./. {}
