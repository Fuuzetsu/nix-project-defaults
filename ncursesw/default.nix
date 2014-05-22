{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghc763 }:
let
  inherit (haskellPackages) cabal c2hs ncurses utf8String cabalInstall;
in cabal.mkDerivation (self: {
  pname = "ncursesw";
  version = "0.0.0";
  src = /home/shana/programming/vimus/ncursesw;
  buildDepends = [ utf8String ];
  buildTools = [ c2hs cabalInstall ];
  extraLibraries = [ ncurses ];
  meta = {
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
