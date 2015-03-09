{ mkDerivation, base, hspec, parsec, QuickCheck, stdenv
, string-conversions, template-haskell, text
}:
mkDerivation {
  pname = "servant";
  version = "0.2.2";
  sha256 = "1pblmnarq1939d2krwbmd9ssm68ar9ip54dl28zjv2j51vhhhzhc";
  buildDepends = [
    base parsec string-conversions template-haskell text
  ];
  testDepends = [
    base hspec parsec QuickCheck string-conversions text
  ];
  homepage = "http://haskell-servant.github.io/";
  description = "A family of combinators for defining webservices APIs";
  license = stdenv.lib.licenses.bsd3;
}
