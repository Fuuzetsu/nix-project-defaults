let pkgs = import <nixpkgs> {};
    haskellPackages = pkgs.haskellPackages.override {
      extension = self: super: {
        krpc = self.callPackage ./. {};
      };
    };
in haskellPackages.krpc