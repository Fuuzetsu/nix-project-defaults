{ mkDerivation, base, bindings-portaudio, boundingboxes
, clean-unions, colors, containers, control-bool, deepseq
, directory, distributive, elevator, extensible, filepath
, freetype2, GLFW-b, hashable, JuicyPixels, JuicyPixels-util, lens
, linear, minioperational, mtl, objective, OpenGL, OpenGLRaw
, random, reflection, stdenv, template-haskell, text, transformers
, vector, WAVE
}:
mkDerivation {
  pname = "call";
  version = "0.1.3";
  sha256 = "11gk7wgkrid6k546ilcz3ik8cwclfss6hby1rgla9znyd5lqk7l9";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    base bindings-portaudio boundingboxes clean-unions colors
    containers control-bool deepseq directory distributive elevator
    extensible filepath freetype2 GLFW-b hashable JuicyPixels
    JuicyPixels-util lens linear minioperational mtl objective OpenGL
    OpenGLRaw random reflection template-haskell text transformers
    vector WAVE
  ];
  homepage = "https://github.com/fumieval/call";
  description = "The call game engine";
  license = stdenv.lib.licenses.bsd3;
}
