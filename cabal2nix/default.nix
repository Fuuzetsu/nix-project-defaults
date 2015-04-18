{ aeson, base, bytestring, Cabal, containers, deepseq, deepseq-generics
, directory, filepath, hackage-db, monad-par, monad-par-extras, mtl, pretty
, prettyclass, process, QuickCheck, regex-posix, SHA, split, transformers
, utf8-string, doctest, hspec, stdenv, mkDerivation }:

mkDerivation {
  pname = "cabal2nix";
  version = "2.0";
  src = /home/shana/programming/cabal2nix;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    aeson base bytestring Cabal containers deepseq deepseq-generics
    directory filepath hackage-db monad-par monad-par-extras mtl pretty
    prettyclass process QuickCheck regex-posix SHA split transformers
    utf8-string
  ];
  testDepends = [
    aeson base bytestring Cabal containers deepseq deepseq-generics
    directory doctest filepath hackage-db hspec monad-par
    monad-par-extras mtl pretty prettyclass process QuickCheck
    regex-posix SHA split transformers utf8-string
  ];
  homepage = "http://github.com/NixOS/cabal2nix";
  description = "Convert Cabal files into Nix build instructions";
  license = stdenv.lib.licenses.bsd3;
}
