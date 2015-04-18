let pkgs = import <nixpkgs> {};
    packageSet = pkgs.haskell-ng.packages.ghc7101;
in packageSet.callPackage ./. {}
