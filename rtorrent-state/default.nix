{ mkDerivation, base, bencoding, bytestring, containers, directory
, filepath, hspec, lens, QuickCheck, stdenv, temporary, utf8-string
}:
mkDerivation {
  pname = "rtorrent-state";
  version = "0.1.0.1";
  src = /home/shana/programming/rtorrent-state;
  buildDepends = [
    base bencoding bytestring containers directory filepath lens
    utf8-string
  ];
  testDepends = [
    base bencoding bytestring containers directory filepath hspec
    QuickCheck temporary utf8-string
  ];
  homepage = "http://github.com/Fuuzetsu/rtorrent-state";
  description = "Parsing and manipulation of rtorrent state file contents";
  license = stdenv.lib.licenses.gpl3;
}
