{ pkgs }:

with pkgs;
let

  nixpkgsGit = import /home/shana/programming/nixpkgs {};
  # Directories where I'll store extra packages.
  normalProjectDir = "/home/shana/programming/nix-project-defaults/";
  haskellProjectDir = normalProjectDir + "haskell-tmp-defaults/";

  # Wrap callPackage with the default Haskell directories.
  haskellPackage = s: p: s.callPackage (haskellProjectDir + p) {};
  haskellPackageS = s: p: s.callPackage (haskellProjectDir + p);
  normalPackage = p: callPackage (normalProjectDir + p) {};
  normalPackage32 = p: callPackage_i686 (normalProjectDir + p) {};

  # Wrap callPackage with the default non-Haskell directories.
  normalPackageS = s: p: s.callPackage (normalProjectDir + p) {};

  nixpkgsTop = "/home/shana/programming/nixpkgs/pkgs/";
  nixpkgsNorm = p: pkgs.callPackage (nixpkgsTop + p);

  nixpkgsHask = "/home/shana/programming/nixpkgs/pkgs/development/libraries/haskell/";
  nixpkgHaskell = s: p: s.callPackage (nixpkgsHask + p) {};

  buildLocally = pk: p: pk.lib.overrideDerivation p (attrs: { buildInputs = []; preferLocalBuild = true; });
  buildAllLocally = pk: pk.lib.attrsets.mapAttrs (n: v: buildLocally pk v);

in
{ ffmpeg.x11grab = true;
  allowUnfree = true;
  packageOverrides = self: rec {

  # Define own GHC HEAD package pointing to local checkout.
  packages_ghcHEAD = self.haskell.packages {
    ghcPath = /home/shana/programming/ghc;
    ghcBinary = self.haskellPackages.ghcPlain;
    prefFun = self.haskell.ghcHEADPrefs;
  };

  # Define different GHC HEAD configurations.
  haskellPackages_ghcHEAD = recurseIntoAttrs packages_ghcHEAD.highPrio;
  haskellPackages_ghcHEAD_profiling = recurseIntoAttrs packages_ghcHEAD.profiling;
  haskellPackages_ghcHEAD_no_profiling = recurseIntoAttrs packages_ghcHEAD.noProfiling;

  # Haskell packages I want to use that reside out of nixpkgs or don't
  # have the settings I want.
  ownHaskellPackages = ver : recurseIntoAttrs (ver.override {
    extension = se : su : rec {

      cabal2nix         = normalPackageS se "cabal2nix";
      krpc              = normalPackageS se "krpc";
      intset            = haskellPackage se "intset";
      prettyClass       = haskellPackage se "pretty-class";
      splitChannel      = haskellPackage se "split-channel";
      bitsExtras        = haskellPackage se "bits-extras";
      base32Bytestring  = haskellPackage se "base32-bytestring";
      haskoin           = haskellPackage se "haskoin";
      haddock           = normalPackageS se "haddock";
      haddockLibrary    = normalPackageS se "haddock-library";
      haddockApi        = normalPackageS se "haddock-api";
      yi                = normalPackageS se "yi";
      hask              = haskellPackage se "hask";
      bittorrent        = normalPackageS se "bittorrent";
      gtk3hs            = haskellPackage se "gtk3";
      yiMonokai         = normalPackageS se "yi-monokai";
      yiHaskellUtils    = normalPackageS se "yi-haskell-utils";
      lensAeson         = haskellPackage se "lens-aeson";
      tsuntsun          = normalPackageS se "tsuntsun";
      wordTrie          = normalPackageS se "word-trie";
      ooPrototypes      = normalPackageS se "oo-prototypes";
      #yiLanguage        = normalPackageS se "yi-language";
      hstorrent         = normalPackageS se "hstorrent";
      haskellTracker    = normalPackageS se "haskell-tracker";
      yiRope            = normalPackageS se "yi-rope";
      oszLoader         = normalPackageS se "osz-loader";
      hnix              = se.callPackage "/home/shana/programming/hnix" {};
      yiNixLexer        = normalPackageS se "yi-nix-lexer";
      dynamicState      = normalPackageS se "dynamic-state";
      bindingsPortaudio = haskellPackage se "bindings-portaudio";
      call              = haskellPackage se "call";
      yiFuzzyOpen       = normalPackageS se "yi-fuzzy-open";
      yiAgda            = normalPackageS se "yi-agda";
      yiCustom          = se.callPackage (nixpkgsTop + "applications/editors/yi/yi-custom.nix") {
        extraPackages = p: [ p.yiFuzzyOpen p.yiMonokai p.yiHaskellUtils p.lens p.yiAgda ];
      };
    };

  });

  # This is similar to ownHaskellPackages except that it uses my local
  # nixpkgs checkout as a base which means that I don't have to
  # duplicate some expressions and wait for the channel to catch up.
  ownHaskellPackagesGit = ver : nixpkgsGit.recurseIntoAttrs (ver.override {
    extension = se : su : rec {
      yiHaskellUtils = normalPackageS se "yi-haskell-utils";
      yiAgda         = normalPackageS se "yi-agda";
      yiCustom       = su.yiCustom.override {
        extraPackages = p: [ p.yiFuzzyOpen p.yiMonokai p.yiHaskellUtils p.lens p.yiAgda ];
      };

    };
  });


  # Derive package sets for every version of GHC I'm interested in.
  myHaskellPackages_ghc742 = ownHaskellPackages haskellPackages_ghc742;
  myHaskellPackages_ghc763 = ownHaskellPackages haskellPackages_ghc763;
  myHaskellPackages_ghc783 = ownHaskellPackages haskellPackages_ghc783;
  myHaskellPackages_ghc783_profiling =
    ownHaskellPackages haskellPackages_ghc783_profiling;

  myHaskellPackages = myHaskellPackages_ghc783;
  myHaskellPackages_profiling = myHaskellPackages_ghc783_profiling;

  myHaskellPackages_ghc783_nixpkgs = ownHaskellPackagesGit nixpkgsGit.haskellPackages_ghc783;
  myHaskellPackages_nixpkgs = myHaskellPackages_ghc783_nixpkgs;

  # Packages that aren't Haskell packages.

  wlc = normalPackage "wlc";
  loliwm = normalPackage "loliwm";
  youtubeDL = normalPackage "youtube-dl";
  };
}
