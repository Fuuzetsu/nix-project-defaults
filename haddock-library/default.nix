{ pkgs ? import <nixpkgs> {}
, haskellPackages ? pkgs.haskellPackages_ghc783
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "haddock-library";
  version = "1.1.0";
  src = /home/shana/programming/haddock/haddock-library;
  testDepends = with haskellPackages; [ QuickCheck hspec baseCompat ];
  buildDepends = with haskellPackages; [ deepseq ];
  isLibrary = true;
  isExecutable = false;
  enableSplitObjs = false;
  doCheck = true;
})