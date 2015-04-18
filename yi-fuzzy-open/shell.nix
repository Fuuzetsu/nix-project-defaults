let pkgs = import <nixpkgs> {};
    packageSet = pkgs.yi_packages pkgs.haskell-ng.packages.ghc7101;
in packageSet.callPackage ./. {}
