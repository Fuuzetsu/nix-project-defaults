let pkgs = import <nixpkgs> {};
    haskellPackages = pkgs.myHaskellPackages.override {
      extension = self: super: {
        tsuntsun = self.callPackage ./. (pkgs.myHaskellPackages);
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.tsuntsun (attrs: {
  #buildInputs = [ haskellPackages.cabalInstall ] ++ attrs.buildInputs;
  buildInputs = attrs.buildInputs;
})
