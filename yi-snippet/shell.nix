let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.haskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        yiSnippet = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.yiSnippet