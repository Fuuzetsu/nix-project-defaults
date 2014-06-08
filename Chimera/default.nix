{ haskellPackages ? (import <nixpkgs>{}).myHaskellPackages_ghc763
}:
let
  inherit (haskellPackages) cabal dataDefault freeGame lens
    minioperational mtl time transformers vector;

in cabal.mkDerivation (self: {
  pname = "Chimera";
  version = "0.1.2.0";
  src = /home/shana/programming/Chimera;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    dataDefault freeGame lens minioperational mtl time
    transformers vector
  ];
  meta = {
    homepage = "https://github.com/myuon/Chimera";
    description = "something fun and new through gaming";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
