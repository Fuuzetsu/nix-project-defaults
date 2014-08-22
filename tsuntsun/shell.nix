let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages_ghc783;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        tsuntsun = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.tsuntsun
