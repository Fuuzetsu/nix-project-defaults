let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        yiFuzzyOpen = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.yiFuzzyOpen