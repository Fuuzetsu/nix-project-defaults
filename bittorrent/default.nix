{ haskellPackages ? (import <nixpkgs> {}).myHaskellPackages_ghc783
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "bittorrent";
  version = "0.0.0.3";
  src = /home/shana/programming/bittorrent;
  isLibrary = true;
  isExecutable = true;
  buildDepends = with haskellPackages; [
    attoparsec base16Bytestring base32Bytestring base64Bytestring
    bencoding bitsExtras cereal cerealConduit conduit conduitExtra
    convertible cryptohash dataDefault deepseq entropy fastLogger
    filepath hashable hslogger httpClient httpConduit httpTypes intset
    iproute krpc lens liftedAsync liftedBase mmap monadControl
    monadLogger mtl network optparseApplicative parallelIo prettyClass
    PSQueue random randomShuffle resourcet SafeSemaphore split
    splitChannel stm text time transformersBase unorderedContainers
    vector
  ];
  testDepends = with haskellPackages; [
    async bencoding cereal conduit conduitExtra convertible dataDefault
    filepath hspec httpTypes iproute krpc monadLogger monadLoops mtl
    network optparseApplicative QuickCheck quickcheckInstances
    resourcet text time
  ];
  meta = {
    homepage = "https://github.com/cobit/bittorrent";
    description = "BitTorrent protocol implementation";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
