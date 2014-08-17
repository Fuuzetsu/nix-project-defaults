let pkgs = import <nixpkgs> {};
    haskellPackages = pkgs.myHaskellPackages.override {
      extension = self: super: {
        bittorrent = self.callPackage ./. { inherit (pkgs.myHaskellPackages)
                                            base32Bytestring bitsExtras intset
                                            krpc prettyClass splitChannel; };
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.bittorrent (attrs: {
  buildInputs = [ haskellPackages.cabalInstall ] ++ attrs.buildInputs;
})
