{ mkDerivation, base, binary, data-default, derive, ghc-mod, lens
, network, PastePipe, split, stdenv, text, yi, yi-language, yi-rope
}:
mkDerivation {
  pname = "yi-haskell-utils";
  version = "0.1.0.2";
  src = /home/shana/programming/yi-haskell-utils;
  buildDepends = [
    base binary data-default derive ghc-mod lens network PastePipe
    split text yi yi-language yi-rope
  ];
  homepage = "https://github.com/Fuuzetsu/yi-haskell-utils";
  description = "Collection of functions for working with Haskell in Yi";
  license = stdenv.lib.licenses.gpl3;
}
