{ pkgs ? (import <nixpkgs> {})
, haskellPackages ? pkgs.myHaskellPackages_ghc783
, git ? pkgs.git
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "Combinatorrent";
  version = "0.3.2";
  src = /home/shana/programming/combinatorrent;
  jailbreak = true;
  isLibrary = false;
  isExecutable = true;
  buildDepends = with haskellPackages; [
    attoparsec cereal deepseq filepath hopenssl hslogger HTTP HUnit mtl
    network parsec PSQueue QuickCheck random
    randomShuffle stm testFramework testFrameworkHunit
    testFrameworkQuickcheck2 time cryptohash git cabalInstall
  ];
  meta = {
    description = "A concurrent bittorrent client";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
