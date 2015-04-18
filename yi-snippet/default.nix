{ mkDerivation, base, containers, stdenv, yi, yi-rope }:
mkDerivation {
  pname = "yi-snippet";
  version = "0.1.0.0";
  src = /home/shana/programming/yi-snippet;
  buildDepends = [ base containers yi yi-rope ];
  homepage = "https://github.com/yi-editor/yi-snippet";
  description = "Snippet support for Yi";
  license = stdenv.lib.licenses.gpl2;
}
