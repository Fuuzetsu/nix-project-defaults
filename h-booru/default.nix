{ mkDerivation, async, base, bytestring, containers, directory
, filepath, http-conduit, hxt, mtl, split, stdenv, stm
, template-haskell, transformers, utf8-string, vinyl
}:
mkDerivation {
  pname = "h-booru";
  version = "0.3.0.0";
  src = /home/shana/programming/h-booru;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    async base bytestring containers directory filepath http-conduit
    hxt mtl split stm template-haskell transformers utf8-string vinyl
  ];
  homepage = "https://github.com/Fuuzetsu/h-booru";
  description = "Haskell library for retrieving data from various booru image sites";
  license = stdenv.lib.licenses.gpl3;
}
