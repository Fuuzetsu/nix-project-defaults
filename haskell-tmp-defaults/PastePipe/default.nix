# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, cmdargs, HTTP, network }:

cabal.mkDerivation (self: {
  pname = "PastePipe";
  version = "1.5";
  sha256 = "1jqfk6d22vi0vrwx0whjkh4pxwagr4hmi79bid6bffn72c7ygm8f";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ cmdargs HTTP network ];
  meta = {
    homepage = "http://github.com/creswick/pastepipe";
    description = "CLI for pasting to lpaste.net";
    license = "GPL";
    platforms = self.ghc.meta.platforms;
  };
})