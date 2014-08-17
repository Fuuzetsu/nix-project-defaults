let pkgs = import <nixpkgs> {};
    haskellPackages = pkgs.myHaskellPackages.override {
      extension = self: super: {
        bittorrent = self.callPackage ./. (pkgs.myHaskellPackages);
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.bittorrent (attrs: {
  buildInputs = [ haskellPackages.cabalInstall ] ++ attrs.buildInputs;
})
