let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        yiLanguage = myHaskellPackages.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.yiLanguage (attrs: {
  buildInputs = [ myHaskellPackages.cabalInstall ] ++ attrs.buildInputs;
})