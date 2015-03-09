let pkgs = import <nixpkgs> {};
    packageSet = pkgs.myrapi_packages pkgs.haskell-ng.packages.ghc784;
in packageSet.callPackage ./. {}
