let pkgs = import <nixpkgs> {};
    packageSet = pkgs.servant_packages pkgs.haskell-ng.packages.ghc784;
in packageSet.callPackage ./. {}
