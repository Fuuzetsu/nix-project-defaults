# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, attoparsec, hspec, QuickCheck, text }:

cabal.mkDerivation (self: {
  pname = "osz-loader";
  version = "0.1.0.0";
  src = /home/shana/programming/osz-loader;
  buildDepends = [ attoparsec text ];
  testDepends = [ attoparsec hspec QuickCheck text ];
  meta = {
    homepage = "http://github.com/Fuuzetsu/osz-loader";
    description = "Loads up osu! .osz files, including parsing any .osu files inside";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
