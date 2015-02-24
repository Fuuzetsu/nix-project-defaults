{ mkDerivation, array, base, boundingboxes, colors, containers
, control-bool, directory, filepath, free, freetype2, GLFW-b
, hashable, JuicyPixels, JuicyPixels-util, lens, linear, mtl
, OpenGL, OpenGLRaw, random, reflection, stdenv, template-haskell
, transformers, vector, void
}:
mkDerivation {
  pname = "free-game";
  version = "1.1.80";
  src = /home/shana/programming/free-game;
  buildDepends = [
    array base boundingboxes colors containers control-bool directory
    filepath free freetype2 GLFW-b hashable JuicyPixels
    JuicyPixels-util lens linear mtl OpenGL OpenGLRaw random reflection
    template-haskell transformers vector void
  ];
  homepage = "https://github.com/fumieval/free-game";
  description = "Create games for free";
  license = stdenv.lib.licenses.bsd3;
}
