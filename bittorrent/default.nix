{ pkgs ? (import <nixpkgs> {})
, haskellPackages ? pkgs.myHaskellPackages_ghc783
, krpcLocal ? (import /home/shana/programming/krpc {})
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "bittorrent";
  version = "0.0.0.3";
  src = /home/shana/programming/bittorrent;
  isLibrary = true;
  isExecutable = true;
  configureFlags="-ftesting";
  buildDepends = with haskellPackages; [
    attoparsec base16Bytestring base32Bytestring base64Bytestring
    bencoding bitsExtras cereal cerealConduit conduit conduitExtra
    convertible cryptohash dataDefault deepseq entropy fastLogger
    filepath hashable hslogger httpClient httpConduit httpTypes intset
    iproute krpcLocal lens liftedAsync liftedBase mmap monadControl
    monadLogger mtl network optparseApplicative parallelIo prettyClass
    PSQueue random randomShuffle resourcet SafeSemaphore split
    splitChannel stm text time transformersBase unorderedContainers
    vector cabalInstall
  ];
  testDepends = with haskellPackages; [
    async bencoding cereal conduit conduitExtra convertible dataDefault
    filepath hspec httpTypes iproute krpcLocal monadLogger monadLoops mtl
    network optparseApplicative QuickCheck quickcheckInstances
    resourcet text time pkgs.screen pkgs.rtorrent temporary
  ];
  meta = {
    homepage = "https://github.com/cobit/bittorrent";
    description = "BitTorrent protocol implementation";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
