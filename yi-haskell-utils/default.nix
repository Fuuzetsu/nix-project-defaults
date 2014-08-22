# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, binary, dataDefault, derive, ghcMod, lens, network
, PastePipe, split, yi, ...
}:

cabal.mkDerivation (self: {
  pname = "yi-haskell-utils";
  version = "0.1.0.0";
  src = /home/shana/programming/yi-haskell-utils;
  buildDepends = [
    binary dataDefault derive ghcMod lens network PastePipe split yi
  ];
  meta = {
    homepage = "https://github.com/Fuuzetsu/yi-haskell-utils";
    description = "Collection of functions for working with Haskell in Yi";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
