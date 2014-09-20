let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages_profiling;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        yiContrib = myHaskellPackages.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.yiContrib (attrs: {
  noHaddock = true;
  buildInputs = [ myHaskellPackages.cabalInstall ] ++ attrs.buildInputs;
})
