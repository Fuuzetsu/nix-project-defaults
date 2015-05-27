{ mkDerivation, array, base, binary, bytestring, Cabal, containers
, data-default, directory, dlist, dynamic-state, dyre, exceptions
, filepath, glib, gtk, hashable, HUnit, lens, mtl, old-locale
, oo-prototypes, pango, parsec, pointedlist, process, QuickCheck
, random, regex-base, regex-tdfa, safe, semigroups, split, stdenv
, tasty, tasty-hunit, tasty-quickcheck, template-haskell, text
, time, transformers-base, unix, unix-compat, unordered-containers
, vty, word-trie, xdg-basedir, yi-language, yi-rope
}:
mkDerivation {
  pname = "yi";
  version = "0.12.0";
  src = /home/shana/programming/yi;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    array base binary bytestring Cabal containers data-default
    directory dlist dynamic-state dyre exceptions filepath glib gtk
    hashable lens mtl old-locale oo-prototypes pango parsec pointedlist
    process QuickCheck random regex-base regex-tdfa safe semigroups
    split template-haskell text time transformers-base unix unix-compat
    unordered-containers vty word-trie xdg-basedir yi-language yi-rope
  ];
  testDepends = [
    base directory filepath HUnit lens QuickCheck semigroups tasty
    tasty-hunit tasty-quickcheck text yi-language yi-rope
  ];
  configureFlags = [ "-fpango" "-fvty" ];
  homepage = "https://yi-editor.github.io";
  description = "The Haskell-Scriptable Editor";
  license = stdenv.lib.licenses.gpl2;
}
