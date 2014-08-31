# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, baseCompat, deepseq, hspec, QuickCheck }:

let pkgs = import <nixpkgs> {};
    lib = pkgs.lib;
    s = /home/shana/programming/haddock/haddock-library;
    file = builtins.readFile (s + "/haddock-library.cabal");
    strs = lib.strings.splitString "\n" file;
    vstr = builtins.head (builtins.filter (s: lib.strings.hasPrefix "version:" s) strs);
    vrsn = lib.strings.removePrefix "version:" (lib.strings.replaceChars [" "] [""] vstr);
in
cabal.mkDerivation (self: {
  pname = "haddock-library";
  version = vrsn;
  src = s;
  buildDepends = [ deepseq ];
  testDepends = [ baseCompat deepseq hspec QuickCheck ];
  meta = {
    homepage = "http://www.haskell.org/haddock/";
    description = "Library exposing some functionality of Haddock";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
