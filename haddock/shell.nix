let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        haddock = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.haddock