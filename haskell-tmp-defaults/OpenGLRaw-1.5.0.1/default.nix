{ mkDerivation, base, mesa, stdenv }:
mkDerivation {
  pname = "OpenGLRaw";
  version = "1.5.0.1";
  sha256 = "0hnsmijgvy04d02d0gwk4bl6imhlpwgdcsp1livvca59hzc7r8m3";
  buildDepends = [ base ];
  extraLibraries = [ mesa ];
  homepage = "http://www.haskell.org/haskellwiki/Opengl";
  description = "A raw binding for the OpenGL graphics system";
  license = stdenv.lib.licenses.bsd3;
}
