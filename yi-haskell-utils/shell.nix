let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        yiHaskellUtils = self.callPackage ./.
          (myHaskellPackages // { ghcMod = haskellPackages.ghcMod_5_0_1_1; });
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.yiHaskellUtils (attrs: {
  buildInputs = [  ] ++ attrs.buildInputs;
})
