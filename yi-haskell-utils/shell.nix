let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        yiHaskellUtils = self.callPackage ./.
          (myHaskellPackages // { ghcMod = myHaskellPackages.ghcMod_5_0_1; });
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.yiHaskellUtils (attrs: {
  buildInputs = [  ] ++ attrs.buildInputs;
})
