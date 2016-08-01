{ mkDerivation, base, filepath, haddock-api, haddock-test, hspec
, stdenv
}:
mkDerivation {
  pname = "haddock";
  version = "2.17.0";
  src = /home/shana/programming/haddock;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base haddock-api ];
  testHaskellDepends = [ base filepath haddock-test hspec ];
  preCheck = "unset GHC_PACKAGE_PATH";
  homepage = "http://www.haskell.org/haddock/";
  description = "A documentation-generation tool for Haskell libraries";
  license = stdenv.lib.licenses.bsd3;
}
