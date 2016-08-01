let pkgs = import <nixpkgs> {};
    packageSet = pkgs.hspec_packages pkgs.haskell-ng.packages.ghcHEAD;
in packageSet.callPackage ./. {}
