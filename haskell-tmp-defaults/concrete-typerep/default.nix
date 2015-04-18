{ mkDerivation, base, binary, hashable, QuickCheck, stdenv
, test-framework, test-framework-quickcheck2
}:
mkDerivation {
  pname = "concrete-typerep";
  version = "0.1.0.2";
  src = /home/shana/programming/concrete-typerep;
  buildDepends = [ base binary hashable ];
  testDepends = [
    base binary hashable QuickCheck test-framework
    test-framework-quickcheck2
  ];
  description = "Binary and Hashable instances for TypeRep";
  license = stdenv.lib.licenses.bsd3;
}
