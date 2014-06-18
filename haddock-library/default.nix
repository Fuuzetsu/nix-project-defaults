{ haskellPackages ? (import <nixpkgs> {}).myHaskellPackages_ghc763
}:
let
  inherit (haskellPackages) cabal deepseq QuickCheck hspec baseCompat;
in
cabal.mkDerivation (self: {
  pname = "haddock-library";
  version = "2.15.0";
  src = /home/shana/programming/haddock/haddock-library;
  testDepends = [ QuickCheck hspec baseCompat ];
  buildDepends = [ deepseq ];
  isLibrary = true;
  isExecutable = false;
  enableSplitObjs = false;
})