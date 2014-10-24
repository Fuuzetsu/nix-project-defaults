let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        shakuganNoHaskell = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.shakuganNoHaskell