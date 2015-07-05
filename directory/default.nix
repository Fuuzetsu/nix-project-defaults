{ mkDerivation, base, filepath, stdenv, time, unix, autoconf, automake }:
mkDerivation {
  pname = "directory";
  version = "1.2.3.0";
  src = /home/shana/programming/directory;
  preConfigure = "autoreconf -i";
  buildDepends = [ base filepath time unix autoconf automake ];
  testDepends = [ base filepath time unix ];
  description = "Platform-agnostic library for filesystem operations";
  license = stdenv.lib.licenses.bsd3;
}
