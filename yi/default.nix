{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghc763 }:
let
  inherit (haskellPackages) cabal cabalInstall_1_18_0_3 alex
    binary Cabal cautiousFile concreteTyperep dataDefault derive Diff
    dlist dyre filepath fingertree glib gtk hashable hint lens mtl
    pango parsec pointedlist QuickCheck_2_7_3 random regexBase regexTdfa safe
    split time transformersBase uniplate unixCompat unorderedContainers
    utf8String vty xdgBasedir tfRandom;

in cabal.mkDerivation (self: {
  pname = "yi";
  version = "0.8.1";
  src = /home/shana/programming/yi/yi/src;
  buildDepends = [
    # As imported above
    binary Cabal cautiousFile concreteTyperep dataDefault derive Diff
    dlist dyre filepath fingertree glib gtk hashable hint lens mtl
    pango parsec pointedlist QuickCheck_2_7_3 random regexBase regexTdfa safe
    split time transformersBase uniplate unixCompat unorderedContainers
    utf8String vty xdgBasedir tfRandom
  ];
  buildTools = [ cabalInstall_1_18_0_3 alex ];
  enableSplitObjs = false;
})