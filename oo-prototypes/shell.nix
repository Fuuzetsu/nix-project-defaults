let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        ooPrototypes = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.ooPrototypes