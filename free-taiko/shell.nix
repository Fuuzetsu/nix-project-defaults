let pkgs = import <nixpkgs> {};
    packageSet = pkgs.free-taiko_packages pkgs.haskell-ng.packages.ghc784;
in (packageSet.callPackage ./. {}).env
