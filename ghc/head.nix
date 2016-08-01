{ stdenv, fetchgit, ghc, perl, gmp, ncurses, libiconv, autoconf, automake, happy, alex, git }:

let

  buildMK = ''
    DYNAMIC_BY_DEFAULT = NO
    SRC_HC_OPTS     = -H32m -O -fasm
    GhcStage1HcOpts = -O -fasm
    GhcStage2HcOpts = -O0 -DDEBUG -Wall
    GhcLibHcOpts    = -O -fasm
    GhcLibWays      = v
    SplitObjs       = NO
    ${stdenv.lib.optionalString stdenv.isDarwin ''
      libraries/base_CONFIGURE_OPTS += --configure-option=--with-iconv-includes="${libiconv}/include"
      libraries/base_CONFIGURE_OPTS += --configure-option=--with-iconv-libraries="${libiconv}/lib"
    ''}
  '';

in

stdenv.mkDerivation rec {
  version = "7.10-git";
  name = "ghc-${version}";

  src = "/home/shana/programming/ghc";

  postUnpack = ''
    patchShebangs .
    ./boot
  '';

  buildInputs = [ ghc perl autoconf automake happy alex git ];

  preConfigure = ''
    echo >mk/build.mk "${buildMK}"
    sed -i -e 's|-isysroot /Developer/SDKs/MacOSX10.5.sdk||' configure
  '' + stdenv.lib.optionalString (!stdenv.isDarwin) ''
    export NIX_LDFLAGS="$NIX_LDFLAGS -rpath $out/lib/ghc-${version}"
  '';

  configureFlags = [
    "--with-gcc=${stdenv.cc}/bin/cc"
    "--with-gmp-includes=${gmp}/include" "--with-gmp-libraries=${gmp}/lib"
    "--with-curses-includes=${ncurses}/include" "--with-curses-libraries=${ncurses}/lib"
  ];




  enableParallelBuilding = true;

  # required, because otherwise all symbols from HSffi.o are stripped, and
  # that in turn causes GHCi to abort
  stripDebugFlags = [ "-S" ] ++ stdenv.lib.optional (!stdenv.isDarwin) "--keep-file-symbols";

  meta = {
    homepage = "http://haskell.org/ghc";
    description = "The Glasgow Haskell Compiler";
    maintainers = with stdenv.lib.maintainers; [ marcweber andres simons ];
    inherit (ghc.meta) license platforms;
  };

}
