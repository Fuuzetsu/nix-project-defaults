{ pkgs }:

{ packageOverrides = self: with pkgs; rec {

  haskellPackages_ghcHEAD = self.haskell.packages {
    ghcPath = /home/shana/programming/ghc;
    ghcBinary = self.haskellPackages.ghcPlain;
    prefFun = hself: hsuper: self.haskell.ghcHEADPrefs hself hsuper // {
      mtl = hself.mtl_2_2_0_1;
    };
  };

  cantata = self.cantata.override { withQt4 = false; withQt5 = true; };

}; }
