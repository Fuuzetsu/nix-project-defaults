{ cabal }:

cabal.mkDerivation (self: {
  pname = "pretty-class";
  version = "0.1";
  sha256 = "1q6iqziylsfd5fh0vpgm05wm5fzc3p8cj6frir4gjf5p8ny87d28";
  meta = {
    homepage = "https://src.seereason.com/pretty-class";
    description = "Extremely simple Pretty class";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
