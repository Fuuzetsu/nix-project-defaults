{ mkDerivation, base, cmdargs, HTTP, network, network-uri, stdenv
}:
mkDerivation {
  pname = "PastePipe";
  version = "1.7";
  src = /home/shana/programming/pastepipe;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ base cmdargs HTTP network network-uri ];
  homepage = "http://github.com/Fuuzetsu/pastepipe";
  description = "CLI for pasting to lpaste.net";
  license = stdenv.lib.licenses.gpl3;
}
