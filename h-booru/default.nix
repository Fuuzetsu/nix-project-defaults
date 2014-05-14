{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghc763 }:
let
  inherit (haskellPackages) cabal httpConduit hxt utf8String vinyl cabalInstall;
in
cabal.mkDerivation (self: {
  pname = "h-booru";
  version = "0.1.0.0";
  sha256 = "04xlsikclndx4w979nbfgf3bsw4jnl6d7ipaz92s8iblgfip4y3g";
  buildDepends = [ httpConduit hxt utf8String vinyl ];
  buildTools = [ cabalInstall ];
  meta = {
    homepage = "https://github.com/Fuuzetsu/h-booru";
    description = "Haskell library for retrieving data from various booru image sites";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
