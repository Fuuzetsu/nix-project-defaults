let pkgs = import <nixpkgs> {};
    packageSet = pkgs.hspec_packages pkgs.ghc7102-local;
in packageSet.callPackage ./. {}
