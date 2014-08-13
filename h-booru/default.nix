{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghc783 }:

haskellPackages.cabal.mkDerivation (self: {
  pname = "h-booru";
  version = "0.2.0.0";
  src = /home/shana/programming/h-booru;
  buildDepends = with haskellPackages; [ httpConduit hxt utf8String vinyl singletons ];
  meta = {
    homepage = "https://github.com/Fuuzetsu/h-booru";
    description = "Haskell library for retrieving data from various booru image sites";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
