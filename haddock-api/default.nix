{ mkDerivation, array, base, bytestring, Cabal, containers, deepseq
, directory, filepath, ghc, ghc-paths, haddock-library
, hspec, QuickCheck, stdenv, transformers, xhtml
}:
mkDerivation {
  pname = "haddock-api";
  version = "2.17.0";
  src = /home/shana/programming/haddock/haddock-api;
  libraryHaskellDepends = [
    array base bytestring Cabal containers deepseq directory filepath
    ghc ghc-paths haddock-library transformers xhtml
  ];
  testHaskellDepends = [ base containers ghc hspec QuickCheck ];
  homepage = "http://www.haskell.org/haddock/";
  description = "A documentation-generation tool for Haskell libraries";
  license = stdenv.lib.licenses.bsd3;
}
