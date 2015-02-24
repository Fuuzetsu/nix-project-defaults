{ stdenv, fetchurl, ghc, perl, gmp, ncurses, happy, alex, autoconf, automake, git }:

stdenv.mkDerivation rec {
  version = "HEAD";
  name = "ghc-${version}";

  src = /home/shana/programming/ghc;
  # src = fetchurl {
  #   url = "http://deb.haskell.org/dailies/2014-12-08/ghc_${version}.orig.tar.bz2";
  #   sha256 = "16izfs2cxlyl70i9f98qg90gcaiby5glab14745x4qprpyyig7hi";
  # };

  buildInputs = [ ghc perl gmp ncurses happy alex autoconf automake git ];

  enableParallelBuilding = true;

  buildMK = ''
    libraries/integer-gmp_CONFIGURE_OPTS += --configure-option=--with-gmp-libraries="${gmp}/lib"
    libraries/integer-gmp_CONFIGURE_OPTS += --configure-option=--with-gmp-includes="${gmp}/include"
    libraries/integer-gmp2_CONFIGURE_OPTS += --configure-option=--with-gmp-libraries="${gmp}/lib"
    libraries/integer-gmp2_CONFIGURE_OPTS += --configure-option=--with-gmp-includes="${gmp}/include"
    libraries/terminfo_CONFIGURE_OPTS += --configure-option=--with-curses-includes="${ncurses}/include"
    libraries/terminfo_CONFIGURE_OPTS += --configure-option=--with-curses-libraries="${ncurses}/lib"
    DYNAMIC_BY_DEFAULT = NO
  '';

  preConfigure = ''
    echo >mk/build.mk "${buildMK}"
    sed -i -e 's|-isysroot /Developer/SDKs/MacOSX10.5.sdk||' configure
  '' + stdenv.lib.optionalString (!stdenv.isDarwin) ''
    export NIX_LDFLAGS="$NIX_LDFLAGS -rpath $out/lib/ghc-${version}"
  '';

  configureFlags = [
    "--with-gcc=${stdenv.cc}/bin/cc"
    "--with-gmp-includes=${gmp}/include" "--with-gmp-libraries=${gmp}/lib"
  ];

  # required, because otherwise all symbols from HSffi.o are stripped, and
  # that in turn causes GHCi to abort
  stripDebugFlags = [ "-S" "--keep-file-symbols" ];

  meta = {
    homepage = "http://haskell.org/ghc";
    description = "The Glasgow Haskell Compiler";
    maintainers = [
      stdenv.lib.maintainers.marcweber
      stdenv.lib.maintainers.andres
      stdenv.lib.maintainers.simons
    ];
    inherit (ghc.meta) license platforms;
  };

}
