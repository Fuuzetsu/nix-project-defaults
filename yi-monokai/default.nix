{ mkDerivation, base, stdenv, yi }:
mkDerivation {
  pname = "yi-monokai";
  version = "0.1.1.2";
  src = /home/shana/programming/yi-monokai;
  buildDepends = [ base yi ];
  homepage = "https://github.com/Fuuzetsu/yi-monokai";
  description = "Monokai colour theme for the Yi text editor";
  license = stdenv.lib.licenses.bsd3;
}
