{ mkDerivation, base, binary, hspec, QuickCheck
, quickcheck-instances, stdenv
}:
mkDerivation {
  pname = "udp-parse";
  version = "0.1.0.0";
  src = /home/shana/programming/udp-parse;
  buildDepends = [ base binary ];
  testDepends = [ base hspec QuickCheck quickcheck-instances ];
  homepage = "https://github.com/Fuuzetsu/udp-parse";
  description = "Parser for UDP packets";
  license = stdenv.lib.licenses.bsd3;
}
