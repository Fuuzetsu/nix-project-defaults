{ haskellPackages ? (import <nixpkgs>{}).haskellPackages_ghc763
, lens_4_0_7 ? (import /home/shana/programming/nix-project-defaults/lens/4.0.7.nix {})
}:
let
  inherit (haskellPackages) cabal dataDefault freeGame_1_0_5
    minioperational mtl time transformers vector cabalInstall;

in cabal.mkDerivation (self: {
  pname = "Chimera";
  version = "0.1.2.0";
  src = /home/shana/programming/Chimera;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    dataDefault freeGame_1_0_5 lens_4_0_7 minioperational mtl time
    transformers vector
  ];
  buildTools = [ cabalInstall ];
  meta = {
    homepage = "https://github.com/myuon/Chimera";
    description = "something fun and new through gaming";
    #license = self.stdenv.lib.licenses.unfree;
    platforms = self.ghc.meta.platforms;
  };
})
