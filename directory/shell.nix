let pkgs = import <nixpkgs> {};
    packageSet = pkgs.haskell.packages.ghc7101;
in pkgs.haskell.lib.overrideCabal (packageSet.callPackage ./. {}) (drv: {
  buildDepends = [ packageSet.cabal-install ] ++ drv.buildDepends;
})
