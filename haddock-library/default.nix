{ haskellPackages ? (import <nixpkgs> {}).myHaskellPackages_ghcHEAD
}:
let
  inherit (haskellPackages) cabal deepseq QuickCheck hspec;
in
cabal.mkDerivation (self: {
  pname = "haddock-library";
  version = "2.15.0";
  src = /home/shana/programming/haddock/haddock-library;
  testDepends = [ QuickCheck hspec ];
  buildDepends = [ deepseq ];
  isLibrary = true;
  isExecutable = false;
  enableSplitObjs = false;
})