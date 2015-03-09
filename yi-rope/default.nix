{ mkDerivation, base, binary, bytestring, charsetdetect-ae
, data-default, deepseq, fingertree, hspec, QuickCheck
, quickcheck-instances, stdenv, text, text-icu
}:
mkDerivation {
  pname = "yi-rope";
  version = "0.7.0.0";
  src = /home/shana/programming/yi-rope;
  buildDepends = [
    base binary bytestring charsetdetect-ae data-default deepseq
    fingertree text text-icu
  ];
  testDepends = [ base hspec QuickCheck quickcheck-instances text ];
  description = "A rope data structure used by Yi";
  license = stdenv.lib.licenses.gpl2;
}
