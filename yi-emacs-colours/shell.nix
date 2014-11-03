let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        yiEmacsColours = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.yiEmacsColours