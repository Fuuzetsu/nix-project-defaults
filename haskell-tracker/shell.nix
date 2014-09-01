let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        haskellTracker = myHaskellPackages.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.haskellTracker (attrs: {
  buildInputs = [ ] ++ attrs.buildInputs;
})
