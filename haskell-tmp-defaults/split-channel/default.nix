{ cabal }:

cabal.mkDerivation (self: {
  pname = "split-channel";
  version = "0.2.0.1";
  sha256 = "0w2sgj1f5ydfvhm80d3pbka9988jwl80n14bp5nisawpd2glxvak";
  meta = {
    description = "Control.Concurrent.Chan split into sending and receiving halves.";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
