{ pkgs }:

{ packageOverrides = self: with pkgs; rec {

  haskellPackages_ghcHEAD = self.haskell.packages {
    ghcPath = /home/shana/programming/ghc;
    ghcBinary = self.haskellPackages.ghcPlain;
    prefFun = self.haskell.ghcHEADPrefs;
  };

  myHaskellPackages_ghc763 = myHaskellPackagesVer pkgs.haskellPackages_ghc763;
  myHaskellPackages_ghc782 = myHaskellPackagesVer pkgs.haskellPackages_ghc782;
  myHaskellPackages_ghcHEAD = myHaskellPackagesVer pkgs.haskellPackages_ghcHEAD;

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
                  name = "cantata-1.3.54";
                  src = /home/shana/programming/cantata;
                  unpackPhase = "";
                  sourceRoot = "";
               });
}; }
