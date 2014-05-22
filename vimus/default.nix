{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghc763
, ncursesw ? (import /home/shana/programming/vimus/ncursesw {})
, libmpd ? (import /home/shana/programming/nix-project-defaults/libmpd-haskell {})
}:
let
  inherit (haskellPackages) cabal dataDefault deepseq filepath hspec hspecExpectations
    mtl QuickCheck time transformers wcwidth cabalInstall;

in cabal.mkDerivation (self: {
  pname = "vimus";
  version = "0.0.0";
  src = /home/shana/programming/vimus;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    dataDefault deepseq filepath libmpd mtl ncursesw time wcwidth
  ];
  testDepends = [
    dataDefault deepseq filepath hspec hspecExpectations libmpd mtl
    ncursesw QuickCheck time transformers wcwidth
  ];
  buildTools = [ cabalInstall ];
  meta = {
    description = "An MPD client with vim-like key bindings";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
