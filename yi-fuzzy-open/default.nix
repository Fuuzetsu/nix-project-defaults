{ mkDerivation, base, binary, containers, data-default, directory
, filepath, mtl, stdenv, text, transformers-base, vector, yi
, yi-language, yi-rope
}:
mkDerivation {
  pname = "yi-fuzzy-open";
  version = "0.1.0.1";
  src = /home/shana/programming/yi-fuzzy-open;
  buildDepends = [
    base binary containers data-default directory filepath mtl text
    transformers-base vector yi yi-language yi-rope
  ];
  homepage = "https://github.com/yi-editor/yi-fuzzy-open";
  description = "Fuzzy open plugin for Yi";
  license = stdenv.lib.licenses.gpl2;
}
