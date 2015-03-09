let pkgs = import <nixpkgs> {};
    packageSet = pkgs.haskell-ng.packages.ghc784;
in packageSet.callPackage ./. {}
