let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        wordTrie = myHaskellPackages.callPackage ./. {};
      };
    };
in haskellPackages.wordTrie