{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghcHEAD
, haddockLibrary ? (import /home/shana/programming/haddock/haddock-library {})
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "haddock";
  version = "2.15.0";
  src = /home/shana/programming/haddock/src;
  buildDepends = with haskellPackages;
                   [ Cabal deepseq filepath ghcPaths xhtml haddockLibrary ];
  buildTools = [ haskellPackages.cabalInstall ];
  enableSplitObjs = false;
})