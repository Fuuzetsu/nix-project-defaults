{ pkgs }:

with pkgs;
let
ghcHEAD_overrides = ps: recurseIntoAttrs (ps.override {
  extension = se : su : {
  syb = se.callPackage /home/shana/programming/nixpkgs/pkgs/development/libraries/haskell/syb/0.4.2.nix {};
  vty_5_1_0 = se.callPackage /home/shana/programming/nix-project-defaults/vty/5.1.0.nix {};
  mtl = se.callPackage /home/shana/programming/nix-project-defaults/mtl/2.2.1.nix {};
  testFrameworkSmallcheck =
    se.callPackage /home/shana/programming/nix-project-defaults/test-framework-smallcheck {};
};});

npd = "/home/shana/programming/nix-project-defaults/";
htd = npd + "haskell-tmp-defaults/";

in
{ packageOverrides = self: rec {

  packages_ghcHEAD = self.haskell.packages {
    ghcPath = /home/shana/programming/ghc;
    ghcBinary = self.haskellPackages.ghcPlain;
    prefFun = self.haskell.ghcHEADPrefs;
  };

  haskellPackages_ghcHEAD_no_profiling = ghcHEAD_overrides (recurseIntoAttrs packages_ghcHEAD.noProfiling);
  haskellPackages_ghcHEAD_profiling = ghcHEAD_overrides (recurseIntoAttrs packages_ghcHEAD.profiling);
  haskellPackages_ghcHEAD = ghcHEAD_overrides (recurseIntoAttrs packages_ghcHEAD.highPrio);

  myHaskellPackages_ghc742 = myHaskellPackagesVer haskellPackages_ghc742;
  myHaskellPackages_ghc763 = myHaskellPackagesVer haskellPackages_ghc763;
  myHaskellPackages_ghc783 = myHaskellPackagesVer haskellPackages_ghc783;

  myHaskellPackagesVer = ver : recurseIntoAttrs (ver.override {
    extension = se : su : rec {
      vty_5_1_0 = se.callPackage (npd + "vty/5.1.0.nix") {
        Cabal = se.Cabal_1_20_0_0;
      };
      testFrameworkSmallcheck =
        se.callPackage (npd + "test-framework-smallcheck") {};

      bencoding = se.callPackage (htd + "bencoding") {};
      krpc = se.callPackage (htd + "krpc") {};
      intset = se.callPackage (htd + "intset") {};
      prettyClass = se.callPackage (htd + "pretty-class") {};
      splitChannel = se.callPackage (htd + "split-channel") {};
      bitsExtras = se.callPackage (htd + "bits-extras") {};
      base32Bytestring = se.callPackage (htd + "base32-bytestring") {};
      cryptohash_0_10_0 = se.callPackage (htd + "cryptohash/0.10.0.nix") {};
      cryptohash = se.callPackage (htd + "cryptohash") {};
      #bittorrent = se.callPackage (htd + "bittorrent") { cryptohash = cryptohash_0_10_0; };
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
