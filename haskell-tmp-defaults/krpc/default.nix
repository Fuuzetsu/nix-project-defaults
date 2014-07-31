{ cabal, bencoding, dataDefaultClass, hspec, liftedBase
, monadControl, monadLogger, mtl, network, QuickCheck
, quickcheckInstances, text, transformers
}:

cabal.mkDerivation (self: {
  pname = "krpc";
  version = "0.6.1.0";
  sha256 = "0ldhg4ahhfp4jy3ijssfmcwfg68dggw3biqmc4my2qrcgd2mvx29";
  buildDepends = [
    bencoding dataDefaultClass liftedBase monadControl monadLogger mtl
    network text transformers
  ];
  testDepends = [
    bencoding hspec monadLogger mtl network QuickCheck
    quickcheckInstances
  ];
  meta = {
    homepage = "https://github.com/cobit/krpc";
    description = "KRPC protocol implementation";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
