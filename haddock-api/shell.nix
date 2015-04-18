let pkgs = import <nixpkgs> {};
    packageSet = pkgs.haddock_packages pkgs.haskell-ng.packages.ghc7101;
in pkgs.lib.overrideDerivation (packageSet.callPackage ./. {}) (attrs: {
  buildInputs = [ packageSet.cabal-install ] ++ attrs.buildInputs;
})
