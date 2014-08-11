let
  withPango = true;
  pkgs = import <nixpkgs> { };
  haskellPackages = pkgs.haskellPackages_ghc783;
in
rec {
  yi =
    haskellPackages.cabal.mkDerivation (self: {
      pname = "yi";
      version = "0.9.1";
      src = <yi> + "/yi";
      buildDepends = with haskellPackages; [
        binary Cabal cautiousFile concreteTyperep dataDefault derive Diff
        dlist dyre filepath fingertree hashable hint lens mtl
        parsec pointedlist QuickCheck random regexBase regexTdfa safe
        split time transformersBase uniplate unixCompat unorderedContainers
        utf8String vty xdgBasedir tfRandom text cabalInstall
      ] ++ (if withPango then [ pango gtk glib ] else [ ]);
      buildTools = [ haskellPackages.alex ];
      testDepends = with haskellPackages; [ filepath HUnit QuickCheck tasty
                                            tastyHunit tastyQuickcheck ];

      postInstall = ''
        mv $out/bin/yi $out/bin/.yi-wrapped
        cat - > $out/bin/yi <<EOF
        #! ${self.stdenv.shell}
        # Trailing : is necessary for it to pick up Prelude &c.
        export GHC_PACKAGE_PATH=$(${self.ghc.GHCGetPackages} ${self.ghc.version} \
                                  | sed 's/-package-db\ //g' \
                                  | sed 's/^\ //g' \
                                  | sed 's/\ /:/g')\
        :$out/lib/ghc-${self.ghc.version}/package.conf.d/yi-$version.installedconf:

        eval exec $out/bin/.yi-wrapped "\$@"
        EOF
        chmod +x $out/bin/yi
      '';
      isLibrary = true;
      isExecutable = true;
      enableSplitObjs = false;
      doCheck = true;
      noHaddock = true;
      configureFlags = [ (if withPango then "-fpango" else "-f-pango") ];
    });

  yi_0_8_2 =
    haskellPackages.cabal.mkDerivation (self: {
      pname = "yi";
      version = "0.8.2";
      sha256 = "18rnyswsdzkh0jdcqfg8pr90mpm6xf11siv598svqkxg12d2qql9";
      buildDepends = with haskellPackages; [
        binary Cabal cautiousFile concreteTyperep dataDefault derive Diff
        dlist dyre filepath fingertree hashable hint lens mtl
        parsec pointedlist QuickCheck random regexBase regexTdfa safe
        split time transformersBase uniplate unixCompat unorderedContainers
        utf8String vty xdgBasedir tfRandom text cabalInstall
      ] ++ (if withPango then [ pango gtk glib ] else [ ]);
      buildTools = [ haskellPackages.alex ];
      testDepends = with haskellPackages; [ filepath HUnit QuickCheck tasty
                                            tastyHunit tastyQuickcheck ];

      postInstall = ''
        mv $out/bin/yi $out/bin/.yi-wrapped
        cat - > $out/bin/yi <<EOF
        #! ${self.stdenv.shell}
        # Trailing : is necessary for it to pick up Prelude &c.
        export GHC_PACKAGE_PATH=$(${self.ghc.GHCGetPackages} ${self.ghc.version} \
                                  | sed 's/-package-db\ //g' \
                                  | sed 's/^\ //g' \
                                  | sed 's/\ /:/g')\
        :$out/lib/ghc-${self.ghc.version}/package.conf.d/yi-$version.installedconf:

        eval exec $out/bin/.yi-wrapped "\$@"
        EOF
        chmod +x $out/bin/yi
      '';
      isLibrary = true;
      isExecutable = true;
      enableSplitObjs = false;
      doCheck = true;
      noHaddock = true;
      configureFlags = [ (if withPango then "-fpango" else "-f-pango") ];
    });


  yi-contrib =

    haskellPackages.cabal.mkDerivation (self: {
      pname = "yi-contrib";
      version = "0.9.1";
      src = <yi> + "/yi-contrib";
      buildDepends = with haskellPackages; [
        filepath lens mtl split time transformersBase yi
      ];
      meta = {
        homepage = "http://haskell.org/haskellwiki/Yi";
        description = "Add-ons to Yi, the Haskell-Scriptable Editor";
        license = "GPL";
        platforms = self.ghc.meta.platforms;
        maintainers = with self.stdenv.lib.maintainers; [ fuuzetsu ];
      };
    });

  yi-monokai =
    haskellPackages.cabal.mkDerivation (self: {
      pname = "yi-monokai";
      version = "0.1.1.2";
      src = <yi-monokai>;
      buildDepends = with haskellPackages; [ yi ];
      meta = {
        homepage = "https://github.com/Fuuzetsu/yi-monokai";
        description = "Monokai colour theme for the Yi text editor";
        license = self.stdenv.lib.licenses.bsd3;
        platforms = self.ghc.meta.platforms;
      };
    });

  PastePipe =
    haskellPackages.cabal.mkDerivation (self: {
      pname = "PastePipe";
      version = "1.5";
      src = <PastePipe>;
      isLibrary = true;
      isExecutable = true;
      buildDepends = with haskellPackages; [ cmdargs HTTP network ];
      meta = {
        homepage = "http://github.com/creswick/pastepipe";
        description = "CLI for pasting to lpaste.net";
        license = "GPL";
        platforms = self.ghc.meta.platforms;
        maintainers = with self.stdenv.lib.maintainers; [ fuuzetsu ];
      };
    });

  yi-haskell-utils =
    haskellPackages.cabal.mkDerivation (self: {
      pname = "yi-haskell-utils";
      version = "0.1.0.0";
      src = <yi-haskell-utils>;
      buildDepends = with haskellPackages; [
        dataDefault derive ghcMod lens network PastePipe split yi
      ];
      meta = {
        homepage = "https://github.com/Fuuzetsu/yi-haskell-utils";
        description = "Collection of functions for working with Haskell in Yi";
        license = self.stdenv.lib.licenses.gpl3;
        platforms = self.ghc.meta.platforms;
      };
    });

  rtorrent-state =
    haskellPackages.cabal.mkDerivation (self: {
      pname = "rtorrent-state";
      version = "0.1.0.0";
      src = <rtorrent-state>;
      buildDepends = with haskellPackages; [ bencoding filepath lens utf8String ];
      testDepends = with haskellPackages; [
        bencoding filepath hspec QuickCheck temporary utf8String
      ];
      meta = {
        homepage = "http://github.com/Fuuzetsu/rtorrent-state";
        description = "Parsing and manipulation of rtorrent state file contents";
        license = self.stdenv.lib.licenses.gpl3;
        platforms = self.ghc.meta.platforms;
      };
    });

  krpc =
    haskellPackages.cabal.mkDerivation (self: {
      pname = "krpc";
      version = "0.6.1.0";
      src = <krpc>;
      buildDepends = with haskellPackages; [
        bencoding dataDefaultClass liftedBase monadControl monadLogger mtl
        network text transformers
      ];
      testDepends = with haskellPackages; [
        bencoding hspec monadLogger mtl network QuickCheck
        quickcheckInstances
      ];
      meta = {
        homepage = "https://github.com/cobit/krpc";
        description = "KRPC protocol implementation";
        license = self.stdenv.lib.licenses.bsd3;
        platforms = self.ghc.meta.platforms;
      };
    });

  Yukari =
    haskellPackages.cabal.mkDerivation (self: {
      pname = "Yukari";
      version = "0.1.0.0";
      src = <Yukari>;
      isLibrary = true;
      isExecutable = true;
      buildDepends = with haskellPackages; [
        attoparsec curl downloadCurl dyre filepath HandsomeSoup HTTP hxt
        lens network text
      ];
      testDepends = with haskellPackages; [ filepath hspec lens QuickCheck ];
      meta = {
        homepage = "http://github.com/Fuuzetsu/yukari";
        description = "Command line program that allows for automation of various tasks on the AnimeBytes private tracker website";
        license = self.stdenv.lib.licenses.gpl3;
        platforms = self.ghc.meta.platforms;
      };
    });

  shakugan-no-haskell =
    haskellPackages.cabal.mkDerivation (self: {
      pname = "shakugan-no-haskell";
      version = "0.0.0.0";
      src = <shakugan-no-haskell>;
      isLibrary = false;
      isExecutable = true;
      buildDepends = with haskellPackages; [
        dataDefault freeGame lens minioperational mtl time transformers
        vector
      ];
      meta = {
        homepage = "https://github.com/Fuuzetsu/shakugan-no-haskell";
        description = "Simple game featuring the best character";
        license = self.stdenv.lib.licenses.gpl3;
        platforms = self.ghc.meta.platforms;
      };
    });

  h-booru =
    haskellPackages.cabal.mkDerivation (self: {
      pname = "h-booru";
      version = "0.1.0.0";
      src = <h-booru>;
      isLibrary = true;
      isExecutable = true;
      buildDepends = with haskellPackages; [ httpConduit hxt utf8String vinyl ];
      meta = {
        homepage = "https://github.com/Fuuzetsu/h-booru";
        description = "Haskell library for retrieving data from various booru image sites";
        license = self.stdenv.lib.licenses.gpl3;
        platforms = self.ghc.meta.platforms;
      };
    });

  haddock-library =
    haskellPackages.cabal.mkDerivation (self: {
      pname = "haddock-library";
      version = "1.1.0";
      src = <haddock> + "/haddock-library";
      buildDepends = with haskellPackages; [ deepseq ];
      testDepends = with haskellPackages; [ baseCompat deepseq hspec QuickCheck ];
      meta = {
        homepage = "http://www.haskell.org/haddock/";
        description = "Library exposing some functionality of Haddock";
        license = self.stdenv.lib.licenses.bsd3;
        platforms = self.ghc.meta.platforms;
      };
    });
}
