{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghcHEAD
, haskellBinPackages ? (import <nixpkgs> {}).haskellPackages_ghc782
}:
let
  inherit (haskellPackages) cabal deepseq QuickCheck hspec;
  inherit (haskellBinPackages) cabalInstall;
in
cabal.mkDerivation (self: {
  pname = "haddock-library";
  version = "2.15.0";
  src = ./.;
  testDepends = [ QuickCheck hspec ];
  buildDepends = [ deepseq ];
  buildTools = [ cabalInstall ];
  enableSplitObjs = false;
})