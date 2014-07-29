{ haskellPackages ? (import <nixpkgs> {}).myHaskellPackages_ghc742
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "Combinatorrent";
  version = "0.3.2";
  src = /home/shana/programming/combinatorrent;
  isLibrary = false;
  isExecutable = true;
  jailbreak = true;
  buildDepends = with haskellPackages; [
    attoparsec cereal deepseq filepath hopenssl hslogger HTTP HUnit mtl
    network networkBytestring parsec PSQueue QuickCheck random
    randomShuffle stm testFramework testFrameworkHunit
    testFrameworkQuickcheck2 time cryptohash
  ];
  meta = {
    description = "A concurrent bittorrent client";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
