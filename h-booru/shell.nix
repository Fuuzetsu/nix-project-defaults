let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        hBooru = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.hBooru