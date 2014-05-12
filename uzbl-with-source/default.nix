{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghc782
, pkgs ? (import <nixpkgs> {})
}:
let
  inherit (haskellPackages) cabal filepath cabalInstall process;
  inherit (pkgs) stdenv socat;
in
cabal.mkDerivation (self: {
  pname = "uzbl-with-source";
  version = "0.1.0";
  src = /home/shana/programming/uzbl-with-source;
  buildDepends = [ filepath process socat ];
  buildTools = [ cabalInstall ];
  enableSplitObjs = false;
})