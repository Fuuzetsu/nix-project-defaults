{ cabal, aeson, base16Bytestring, base32Bytestring
, base64Bytestring, bencoding, binary, binaryConduit, bitsExtras
, BoundedChan, cereal, cerealConduit, conduit, cryptohash
, dataDefault, deepseq, entropy, filepath, hashable, hspec, HTTP
, IntervalMap, intset, krpc, lens, mmap, mtl, network
, networkConduit, prettyClass, QuickCheck, quickcheckInstances
, resourcet, SafeSemaphore, split, stm, text, time, transformers
, unorderedContainers, urlencoded, vector
}:

cabal.mkDerivation (self: {
  pname = "bittorrent";
  version = "0.0.0.3";
  sha256 = "155bbqqn33mlavvcm6xfxs4dqij66jfhqxjmrjkyxvzd36yz0ann";
  buildDepends = [
    aeson base16Bytestring base32Bytestring base64Bytestring bencoding
    binary binaryConduit bitsExtras BoundedChan cereal cerealConduit
    conduit cryptohash dataDefault deepseq entropy filepath hashable
    HTTP IntervalMap intset krpc lens mmap mtl network networkConduit
    prettyClass resourcet SafeSemaphore split stm text time
    transformers unorderedContainers urlencoded vector
  ];
  testDepends = [
    aeson bencoding cereal filepath hspec network QuickCheck
    quickcheckInstances text time
  ];
  meta = {
    homepage = "https://github.com/cobit/bittorrent";
    description = "Bittorrent protocol implementation";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
