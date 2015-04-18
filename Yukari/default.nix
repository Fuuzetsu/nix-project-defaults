{ mkDerivation, attoparsec, base, bytestring, curl, directory
, download-curl, dyre, filepath, HandsomeSoup, hspec, HTTP, hxt
, lens, network, QuickCheck, stdenv, text
}:
mkDerivation {
  pname = "Yukari";
  version = "0.1.0.0";
  src = /home/shana/programming/yukari;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    attoparsec base bytestring curl directory download-curl dyre
    filepath HandsomeSoup HTTP hxt lens network text
  ];
  testDepends = [ base directory filepath hspec lens QuickCheck ];
  homepage = "http://github.com/Fuuzetsu/yukari";
  description = "Command line program that allows for automation of various tasks on the AnimeBytes private tracker website";
  license = stdenv.lib.licenses.gpl3;
}
