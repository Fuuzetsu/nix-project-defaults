let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        CM30171-mk440 = myHaskellPackages.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.CM30171-mk440 (attrs: {
  noHaddock = true;
  buildInputs = [ ] ++ attrs.buildInputs;
})
