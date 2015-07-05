{ mkDerivation, base, HUnit, stdenv }:
mkDerivation {
  pname = "hspec-expectations";
  version = "0.7.0";
  src = /home/shana/programming/hspec-expectations;
  buildDepends = [ base HUnit ];
  homepage = "https://github.com/sol/hspec-expectations#readme";
  description = "Catchy combinators for HUnit";
  license = stdenv.lib.licenses.mit;
}
