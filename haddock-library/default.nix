{ mkDerivation, base, base-compat, bytestring, deepseq, hspec
, QuickCheck, stdenv, transformers
}:
mkDerivation {
  pname = "haddock-library";
  version = "1.4.0";
  src = /home/shana/programming/haddock/haddock-library;
  libraryHaskellDepends = [ base bytestring deepseq transformers ];
  testHaskellDepends = [
    base base-compat bytestring deepseq hspec QuickCheck transformers
  ];
  homepage = "http://www.haskell.org/haddock/";
  description = "Library exposing some functionality of Haddock";
  license = stdenv.lib.licenses.bsd3;
}
