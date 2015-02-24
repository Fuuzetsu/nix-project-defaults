{ mkDerivation, base, base-compat, bytestring, deepseq, hspec
, QuickCheck, stdenv, transformers
}:
mkDerivation {
  pname = "haddock-library";
  version = "1.2.0";
  src = /home/shana/programming/haddock/haddock-library;
  buildDepends = [ base bytestring deepseq transformers ];
  testDepends = [
    base base-compat bytestring deepseq hspec QuickCheck transformers
  ];
  homepage = "http://www.haskell.org/haddock/";
  description = "Library exposing some functionality of Haddock";
  license = stdenv.lib.licenses.bsd3;
  maintainers = with stdenv.lib.maintainers; [ fuuzetsu ];
}
