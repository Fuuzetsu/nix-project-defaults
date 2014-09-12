let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages_profiling;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        y = myHaskellPackages.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.y (attrs: {
  noHaddock = true;
  buildInputs = [ myHaskellPackages.cabalInstall ] ++ attrs.buildInputs;
})
