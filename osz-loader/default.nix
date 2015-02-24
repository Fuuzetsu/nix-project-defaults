{ mkDerivation, attoparsec, base, containers, hspec, QuickCheck
, stdenv, text
}:
mkDerivation {
  pname = "osz-loader";
  version = "0.1.0.0";
  src = /home/shana/programming/osz-loader;
  buildDepends = [ attoparsec base containers text ];
  testDepends = [ attoparsec base containers hspec QuickCheck text ];
  homepage = "http://github.com/Fuuzetsu/osz-loader";
  description = "Loads up osu! .osz files, including parsing any .osu files inside";
  license = stdenv.lib.licenses.gpl3;
}
