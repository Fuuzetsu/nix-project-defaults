let
  pkgs = import <nixpkgs> {};
  inherit (pkgs) stdenv fetchurl ghc perl gmp ncurses haskellPackages
                 automake autoconf git dblatex docbook2x
                 docbook_xml_xslt docbook_xml_dtd_45 libxslt libxml2;
in
stdenv.mkDerivation rec {
  name = "ghcDev-${version}";
  version = "7.9.20140512";
  ghcBoot = ghc.ghc782;

  src = "/home/shana/programming/ghc";

  buildInputs = [ ghcBoot perl gmp ncurses automake autoconf git
                  haskellPackages.happy_1_19_3 haskellPackages.alex_3_1_3
                  libxslt libxml2 pkgs.python ];

  enableParallelBuilding = true;

  buildMK = ''
    libraries/integer-gmp_CONFIGURE_OPTS += --configure-option=--with-gmp-libraries="${gmp}/lib"
    libraries/integer-gmp_CONFIGURE_OPTS += --configure-option=--with-gmp-includes="${gmp}/include"
    DYNAMIC_BY_DEFAULT = NO
    BuildFlavour = quick
  '';

  preConfigure = ''
    echo "${buildMK}" > mk/build.mk
    perl boot
    sed -i -e 's|-isysroot /Developer/SDKs/MacOSX10.5.sdk||' configure
  '' + stdenv.lib.optionalString (!stdenv.isDarwin) ''
    export NIX_LDFLAGS="$NIX_LDFLAGS -rpath $out/lib/ghc-${version}"
  '';

  configureFlags = "--with-gcc=${stdenv.gcc}/bin/gcc";

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
    inherit (ghcBoot.meta) license platforms;
  };
}