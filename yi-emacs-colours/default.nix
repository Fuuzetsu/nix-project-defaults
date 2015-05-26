{ mkDerivation, base, containers, split, stdenv, yi-language }:
mkDerivation {
  pname = "yi-emacs-colours";
  version = "0.1.0.1";
  src = /home/shana/programming/yi-emacs-colours;
  buildDepends = [ base containers split yi-language ];
  homepage = "https://github.com/Fuuzetsu/yi-emacs-colours";
  description = "Simple mapping from colour names used in emacs to Color";
  license = stdenv.lib.licenses.gpl2;
}
