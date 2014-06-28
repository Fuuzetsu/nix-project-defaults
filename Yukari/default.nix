{ pkgs ? (import <nixpkgs> {})
, haskellPackages ? pkgs.haskellPackages_ghc763
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "Yukari";
  version = "0.1.0.0";
  src = /home/shana/programming/yukari;
  isLibrary = true;
  isExecutable = true;
  buildDepends = with haskellPackages; [
    attoparsec curl downloadCurl dyre filepath HandsomeSoup HTTP hxt
    network text
  ];
  testDepends = with haskellPackages; [ filepath hspec QuickCheck ];
  meta = {
    homepage = "http://github.com/Fuuzetsu/yukari";
    description = "Command line program that allows for automation of various tasks on the AnimeBytes private tracker website";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
