{ mkDerivation, array, base, bytestring, Cabal, containers, deepseq
, directory, filepath, ghc, ghc-paths, haddock-library, stdenv
, xhtml
}:
mkDerivation {
  pname = "haddock-api";
  version = "2.16.0";
  src = /home/shana/programming/haddock/haddock-api;
  buildDepends = [
    array base bytestring Cabal containers deepseq directory filepath
    ghc ghc-paths haddock-library xhtml
  ];
  homepage = "http://www.haskell.org/haddock/";
  description = "A documentation-generation tool for Haskell libraries";
  license = stdenv.lib.licenses.bsd3;
  maintainers = with stdenv.lib.maintainers; [ fuuzetsu ];
}
