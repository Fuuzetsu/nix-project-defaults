let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        yi = self.callPackage ./. myHaskellPackages;
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.yi (attrs: {
  buildInputs = [ haskellPackages.cabalInstall ] ++ attrs.buildInputs;
})
