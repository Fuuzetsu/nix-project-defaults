{ mkDerivation, aeson, ansi-wl-pprint, base, bytestring, Cabal
, containers, deepseq, deepseq-generics, directory, doctest
, filepath, hackage-db, hspec, lens, monad-par, monad-par-extras
, mtl, optparse-applicative, pretty, process, QuickCheck
, regex-posix, SHA, split, stdenv, transformers, utf8-string
}:
mkDerivation {
  pname = "cabal2nix";
  version = "20150716";
  src = /home/shana/programming/cabal2nix;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    aeson ansi-wl-pprint base bytestring Cabal containers
    deepseq-generics directory filepath hackage-db lens monad-par
    monad-par-extras mtl optparse-applicative pretty process
    regex-posix SHA split transformers utf8-string
  ];
  testDepends = [
    aeson ansi-wl-pprint base bytestring Cabal containers deepseq
    deepseq-generics directory doctest filepath hackage-db hspec lens
    monad-par monad-par-extras mtl optparse-applicative pretty process
    QuickCheck regex-posix SHA split transformers utf8-string
  ];
  homepage = "http://github.com/NixOS/cabal2nix/";
  description = "Convert Cabal files into Nix build instructions";
  license = stdenv.lib.licenses.bsd3;
}
