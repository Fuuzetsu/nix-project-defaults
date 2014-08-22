let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        haddockLibrary = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.haddockLibrary