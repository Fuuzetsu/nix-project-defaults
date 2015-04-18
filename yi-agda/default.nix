{ mkDerivation, attoparsec, base, binary, data-default, directory
, lens, mtl, process, stdenv, text, transformers-base, yi
, yi-language, yi-rope
}:
mkDerivation {
  pname = "yi-agda";
  version = "0.1.0.0";
  src = /home/shana/programming/yi-agda;
  buildDepends = [
    attoparsec base binary data-default directory lens mtl process text
    transformers-base yi yi-language yi-rope
  ];
  homepage = "https://github.com/Fuuzetsu/yi-agda";
  description = "Agda mode for Yi";
  license = stdenv.lib.licenses.gpl3;
}
