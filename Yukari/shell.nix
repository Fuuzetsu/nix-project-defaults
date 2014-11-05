let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        Yukari = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.Yukari