# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal }:

cabal.mkDerivation (self: {
  pname = "oo-prototypes";
  version = "0.1.0.0";
  src = /home/shana/programming/oo-prototypes;
  meta = {
    homepage = "https://github.com/yi-editor/oo-prototypes";
    description = "Support for OO-like prototypes";
    license = self.stdenv.lib.licenses.gpl2;
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ fuuzetsu ];
  };
})
