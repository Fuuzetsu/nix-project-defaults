let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        tsuntsun = self.callPackage ./. myHaskellPackages;
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.tsuntsun (attrs: {
#pkgs.emacs haskellPackages.cabalInstall myHaskellPackages.ghcMod_5_0_1
  buildInputs = [  ] ++ attrs.buildInputs;
})
