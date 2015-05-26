{ mkDerivation, base, binary, containers, derive, hspec, QuickCheck
, stdenv
}:
mkDerivation {
  pname = "word-trie";
  version = "0.2.0.4";
  src = /home/shana/programming/word-trie;
  buildDepends = [ base binary containers derive ];
  testDepends = [ base binary containers derive hspec QuickCheck ];
  homepage = "https://github.com/yi-editor/word-trie";
  description = "Implementation of a finite trie over words";
  license = stdenv.lib.licenses.gpl2;
}
