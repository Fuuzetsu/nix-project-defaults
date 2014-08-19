{ haskellPackages ? (import <nixpkgs> {}).myHaskellPackages_ghc783
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "rtorrent-state";
  version = "0.1.0.1";
  src = /home/shana/programming/rtorrent-state;
  buildDepends = with haskellPackages; [ bencoding utf8String lens ];
  testDepends = with haskellPackages; [ QuickCheck hspec bencoding utf8String temporary ];
  meta = {
    homepage = "http://github.com/Fuuzetsu/rtorrent-state";
    description = "Parsing and manipulation of rtorrent state file contents";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
