{ cabal, network }:

cabal.mkDerivation (self: {
  pname = "network-bytestring";
  version = "0.1.3.4";
  sha256 = "19m10mj9nqsa7s0syv9dyhqkhvmf2h7yna8n7bq0xkdp8m9l0g96";
  buildDepends = [ network ];
  jailbreak = true;
  meta = {
    homepage = "http://github.com/tibbe/network-bytestring";
    description = "Fast, memory-efficient, low-level networking";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
