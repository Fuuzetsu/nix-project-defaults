{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghc763 }:
let
  inherit (haskellPackages) cabal cabalInstall yesod persistent stm conduitExtra
                            yesodBin hjsmin persistentSqlite yesodStatic resourcet
                            blazeMarkup;
in cabal.mkDerivation (self: rec {
  pname = "misaki-booru";
  version = "0.0.0";
  src = /home/shana/programming/misaki-booru;
  buildDepends = [ yesod yesodBin cabalInstall hjsmin persistentSqlite
                   yesodStatic persistent stm conduitExtra resourcet
                   blazeMarkup ];
})