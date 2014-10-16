let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        yiHaskellUtils = self.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.yiHaskellUtils (attrs: {
  buildInputs = [  ] ++ attrs.buildInputs;
})
