let pkgs = import <nixpkgs> {};
    packageSet = pkgs.haddock_packages pkgs.haskell.packages.ghcHEAD;
in pkgs.lib.overrideDerivation (packageSet.callPackage ./. {}) (attrs: {
  buildInputs = [ packageSet.cabal-install ] ++ attrs.buildInputs;
})
