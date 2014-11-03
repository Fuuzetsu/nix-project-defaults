let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        yiAgda = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.yiAgda