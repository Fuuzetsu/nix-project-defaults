# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, filepath, httpConduit, hxt, mtl, stm, transformers
, utf8String, vinyl
}:

cabal.mkDerivation (self: {
  pname = "h-booru";
  version = "0.3.0.0";
  src = /home/shana/programming/h-booru;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    filepath httpConduit hxt mtl stm transformers utf8String vinyl
  ];
  meta = {
    homepage = "https://github.com/Fuuzetsu/h-booru";
    description = "Haskell library for retrieving data from various booru image sites";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ fuuzetsu ];
  };
})
