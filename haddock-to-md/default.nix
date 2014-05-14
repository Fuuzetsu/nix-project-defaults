{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghc782
, haddockLibrary ? (import /home/shana/programming/haddock/haddock-library
    { haskellPackages = haskellPackages; })
}:
let
  inherit (haskellPackages) cabal Cabal cabalInstall;

in
cabal.mkDerivation (self: {
  pname = "haddock-to-md";
  version = "0.1.0";
  src = /home/shana/programming/haddock-to-md/src;
  buildDepends = [ Cabal haddockLibrary ];
  buildTools = [ cabalInstall ];
  enableSplitObjs = false;
})