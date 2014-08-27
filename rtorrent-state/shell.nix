let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        rtorrentState = myHaskellPackages.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.rtorrentState (attrs: {
  buildInputs = [ myHaskellPackages.cabalInstall ] ++ attrs.buildInputs;
})