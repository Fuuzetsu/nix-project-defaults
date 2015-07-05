{ mkDerivation, base, directory, filepath, hspec-meta, stdenv }:
mkDerivation {
  pname = "hspec-discover";
  version = "2.1.8";
  src = /home/shana/programming/hspec/hspec-discover;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ base directory filepath ];
  testDepends = [ base directory filepath hspec-meta ];
  doHaddock = false;
  homepage = "http://hspec.github.io/";
  description = "Automatically discover and run Hspec tests";
  license = stdenv.lib.licenses.mit;
}
