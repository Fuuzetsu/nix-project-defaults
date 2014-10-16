let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages_nixpkgs;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        PastePipe = myHaskellPackages.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.PastePipe (attrs: {
  buildInputs = [ ] ++ attrs.buildInputs;
})
