{ cabal, aeson, binary, byteable, conduit, conduitExtra, cryptohash
, either, HUnit, mtl, pbkdf, QuickCheck, scientific, split
, testFramework, testFrameworkHunit, testFrameworkQuickcheck2, text
, textIcu, vector
}:

cabal.mkDerivation (self: {
  pname = "haskoin";
  version = "0.0.2.1";
  sha256 = "12jbm9yki3gn7bv3sf7l5byhc24l8hrylqwbi3q1n9jyvfwyrz3a";
  buildDepends = [
    aeson binary byteable conduit conduitExtra cryptohash either mtl
    pbkdf scientific split text textIcu vector
  ];
  testDepends = [
    aeson binary byteable conduit conduitExtra cryptohash either HUnit
    mtl pbkdf QuickCheck scientific split testFramework
    testFrameworkHunit testFrameworkQuickcheck2 text textIcu
  ];
  jailbreak = true;
  meta = {
    homepage = "http://github.com/plaprade/haskoin";
    description = "Implementation of the Bitcoin protocol";
    license = self.stdenv.lib.licenses.publicDomain;
    platforms = self.ghc.meta.platforms;
  };
})
