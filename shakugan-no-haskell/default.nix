{ haskellPackages ? (import <nixpkgs>{}).myHaskellPackages_ghc763
}:
let
  inherit (haskellPackages) cabal dataDefault freeGame lens
    minioperational mtl time transformers vector;

in cabal.mkDerivation (self: {
  pname = "shakugan-no-haskell";
  version = "0.0.0.0";
  src = /home/shana/programming/shakugan-no-haskell;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    dataDefault freeGame lens minioperational mtl time
    transformers vector
  ];

  shellHook = "export LD_LIBRARY_PATH=/run/opengl-driver/lib";

  meta = {
    homepage = "https://github.com/Fuuzetsu/shakugan-no-haskell";
    description = "Simple game featuring the best character.";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
