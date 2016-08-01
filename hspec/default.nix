{ mkDerivation, base, directory, hspec-core, hspec-discover
, hspec-expectations, hspec-meta, HUnit, QuickCheck, stdenv
, transformers, stringbuilder
, hlib ? (import <nixpkgs/pkgs/development/haskell-modules/lib.nix> { pkgs = import <nixpkgs> {};})
}:
mkDerivation {
  pname = "hspec";
  version = "2.1.8";
  src = /home/shana/programming/hspec;
  buildDepends = [
    base hspec-core hspec-discover hspec-expectations HUnit QuickCheck
    transformers
  ];
  testDepends = [
    base directory hspec-core hspec-meta (hlib.dontCheck stringbuilder)
  ];
  homepage = "http://hspec.github.io/";
  description = "A Testing Framework for Haskell";
  license = stdenv.lib.licenses.mit;
}
