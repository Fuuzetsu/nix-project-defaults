{ pkgs ? (import <nixpkgs> {})
, haskellPackages ? pkgs.myHaskellPackages_ghc783
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "hs-chip8";
  version = "0.1.0.0";
  src = /home/shana/programming/hs-chip8;
  isLibrary = false;
  isExecutable = true;
  buildDepends = with haskellPackages; [ vector dataDefault mtl ];
  meta = {
    description = "CHIP-8 emulator";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})