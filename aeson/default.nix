{ mkDerivation, attoparsec, base, blaze-builder, bytestring
, containers, deepseq, dlist, ghc-prim, hashable, HUnit, mtl
, QuickCheck, scientific, stdenv, syb, template-haskell
, test-framework, test-framework-hunit, test-framework-quickcheck2
, text, time, transformers, unordered-containers, vector, cabal-install
}:
mkDerivation {
  pname = "aeson";
  version = "0.10.0.0";
  src = /home/shana/programming/aeson;
  buildDepends = [
    attoparsec base blaze-builder bytestring containers deepseq dlist
    ghc-prim hashable mtl scientific syb template-haskell text time
    transformers unordered-containers vector cabal-install
  ];
  testDepends = [
    attoparsec base bytestring containers ghc-prim HUnit QuickCheck
    template-haskell test-framework test-framework-hunit
    test-framework-quickcheck2 text time unordered-containers vector
  ];
  homepage = "https://github.com/bos/aeson";
  description = "Fast JSON parsing and encoding";
  license = stdenv.lib.licenses.bsd3;
}
