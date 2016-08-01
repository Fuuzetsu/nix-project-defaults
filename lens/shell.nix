let pkgs = import <nixpkgs> {};
    packageSet = pkgs.haskell.packages.ghc7101;
in packageSet.callPackage ./. {}
