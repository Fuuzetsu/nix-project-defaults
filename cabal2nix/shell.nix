let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        cabal2nix = myHaskellPackages.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.cabal2nix (attrs: {
  noHaddock = true;
  buildInputs = [ ] ++ attrs.buildInputs;
})
