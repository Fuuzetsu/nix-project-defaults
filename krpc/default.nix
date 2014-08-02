{ haskellPackages ? (import <nixpkgs> {}).myHaskellPackages_ghc783
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "krpc";
  version = "0.6.1.0";
  src = /home/shana/programming/krpc;
  doCheck = false;
  buildDepends = with haskellPackages; [
    bencoding dataDefaultClass liftedBase monadControl monadLogger mtl
    network text transformers
  ];
  testDepends = with haskellPackages; [
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
