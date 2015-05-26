{ mkDerivation, base, stdenv }:
mkDerivation {
  pname = "oo-prototypes";
  version = "0.1.0.0";
  src = /home/shana/programming/oo-prototypes;
  buildDepends = [ base ];
  homepage = "https://github.com/yi-editor/oo-prototypes";
  description = "Support for OO-like prototypes";
  license = stdenv.lib.licenses.gpl2;
}
