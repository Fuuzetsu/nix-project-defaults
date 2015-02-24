{ mkDerivation, base, bytestring, GLURaw, libX11, mesa, OpenGLRaw
, stdenv, text
}:
mkDerivation {
  pname = "OpenGL";
  version = "2.9.2.0";
  sha256 = "1sa5jmhj0az6sik6swv2vgzhv9gj34dbq2px23ag1a4yrk5gcn0p";
  buildDepends = [ base bytestring GLURaw OpenGLRaw text ];
  extraLibraries = [ libX11 mesa ];
  homepage = "http://www.haskell.org/haskellwiki/Opengl";
  description = "A binding for the OpenGL graphics system";
  license = stdenv.lib.licenses.bsd3;
}
