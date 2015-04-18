{ mkDerivation, base, Cabal, directory, filepath, haddock-api
, process, stdenv
}:
mkDerivation {
  pname = "haddock";
  version = "2.16.1";
  src = /home/shana/programming/haddock;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ base haddock-api ];
  testDepends = [ base Cabal directory filepath process ];
  preCheck = "unset GHC_PACKAGE_PATH";
  homepage = "http://www.haskell.org/haddock/";
  description = "A documentation-generation tool for Haskell libraries";
  license = stdenv.lib.licenses.bsd3;
}
