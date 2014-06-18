{ pkgs }:

{ packageOverrides = self: with pkgs; rec {

  haskellPackages_ghcHEAD = self.haskell.packages {
    ghcPath = /home/shana/programming/ghc;
    ghcBinary = self.haskellPackages.ghcPlain;
    prefFun = self.haskell.ghcHEADPrefs;
  };

  myHaskellPackages_ghc763 = myHaskellPackagesVer pkgs.haskellPackages_ghc763;
  myHaskellPackages_ghc782 = myHaskellPackagesVer pkgs.haskellPackages_ghc782;

  myHaskellPackages_ghcHEAD = pkgs.recurseIntoAttrs (haskellPackages_ghcHEAD.override {
    extension = se : su : {
      syb = se.callPackage /home/shana/programming/nixpkgs/pkgs/development/libraries/haskell/syb/0.4.2.nix {};
      vty_5_1_0 = se.callPackage /home/shana/programming/nix-project-defaults/vty/5.1.0.nix {};
      mtl = se.callPackage /home/shana/programming/nix-project-defaults/mtl/2.2.1.nix {};
      testFrameworkSmallcheck =
        se.callPackage /home/shana/programming/nix-project-defaults/test-framework-smallcheck {};
    };
  });

  myHaskellPackagesVer = ver : pkgs.recurseIntoAttrs (ver.override {
    extension = se : su : {
      vty_5_1_0 = se.callPackage /home/shana/programming/nix-project-defaults/vty/5.1.0.nix {
        Cabal = se.Cabal_1_20_0_0;
      };
      testFrameworkSmallcheck =
        se.callPackage /home/shana/programming/nix-project-defaults/test-framework-smallcheck {};
    };
  });

  cantataNixpkgs = self.cantata;
  cantata = lib.overrideDerivation # Local SVN checkout
               (cantataNixpkgs.override { withQt4 = false; withQt5 = true; })
               (attrs: rec {
                  name = "cantata-1.3.54-r4883";
                  src = /home/shana/programming/cantata;
                  unpackPhase = "";
                  sourceRoot = "";
               });
}; }
