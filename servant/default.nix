{ mkDerivation, aeson, attoparsec, base, bytestring, doctest
, filemanip, hspec, http-media, http-types, network-uri, parsec
, QuickCheck, quickcheck-instances, stdenv, string-conversions
, template-haskell, text, url
}:
mkDerivation {
  pname = "servant";
  version = "0.2.2";
  src = /home/shana/programming/servant;
  buildDepends = [
    aeson attoparsec base bytestring http-media http-types network-uri
    parsec string-conversions template-haskell text
  ];
  testDepends = [
    aeson attoparsec base bytestring doctest filemanip hspec parsec
    QuickCheck quickcheck-instances string-conversions text url
  ];
  homepage = "http://haskell-servant.github.io/";
  description = "A family of combinators for defining webservices APIs";
  license = stdenv.lib.licenses.bsd3;
}
