let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        freeTaiko = myHaskellPackages.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.freeTaiko (attrs: {
  noHaddock = true;
  buildInputs = [ ] ++ attrs.buildInputs;
})
