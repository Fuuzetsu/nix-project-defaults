{ cabal, bitsExtras, deepseq, QuickCheck, testFramework
, testFrameworkQuickcheck2
}:

cabal.mkDerivation (self: {
  pname = "intset";
  version = "0.1.1.0";
  sha256 = "044nw8z2ga46mal9pr64vsc714n4dibx0k2lwgnrkk49729c7lk0";
  buildDepends = [ bitsExtras deepseq ];
  testDepends = [
    QuickCheck testFramework testFrameworkQuickcheck2
  ];
  meta = {
    homepage = "https://github.com/pxqr/intset";
    description = "Pure, mergeable, succinct Int sets";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
