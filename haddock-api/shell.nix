let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        haddockApi = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.haddockApi