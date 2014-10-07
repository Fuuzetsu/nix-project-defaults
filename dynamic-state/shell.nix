let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        dynamicState = myHaskellPackages.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.dynamicState (attrs: {
  noHaddock = true;
  buildInputs = [ myHaskellPackages.cabalInstall ] ++ attrs.buildInputs;
})
