{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghcHEAD
, haskellBinPackages ? (import <nixpkgs> {}).haskellPackages_ghc782
, haddockLibrary ? (import /home/shana/programming/haddock/haddock-library {})
}:
let
  inherit (haskellPackages) cabal Cabal deepseq filepath ghcPaths xhtml;
  inherit (haskellBinPackages) cabalInstall;

in
cabal.mkDerivation (self: {
  pname = "haddock";
  version = "2.15.0";
  src = /home/shana/programming/haddock/src;
  buildDepends = [ Cabal deepseq filepath ghcPaths xhtml haddockLibrary ];
  buildTools = [ cabalInstall ];
  enableSplitObjs = false;
})