{ haskellPackages ? (import <nixpkgs>{}).haskellPackages_ghc763
, test ? true
}:
with haskellPackages; cabal.mkDerivation (self: rec {
  pname = "libmpd";
  version = "0.9.0";
  src = /home/shana/programming/libmpd-haskell;
  isLibrary = true;
  isExecutable = false;
  propagatedDependencies = [ cabalInstall ];
  buildDepends = [
    attoparsec dataDefault filepath mtl network text time utf8String
  ];
  testDepends = buildDepends ++ [ QuickCheck hspec ];
  doCheck = test;
})
