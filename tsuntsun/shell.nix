let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        tsuntsun = self.callPackage ./. myHaskellPackages;
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.tsuntsun (attrs: {
  buildInputs = [ myHaskellPackages.ghcMod_5_0_1 ] ++ attrs.buildInputs;
})
