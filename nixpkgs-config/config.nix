{ pkgs }:

with pkgs;
let
  # Directories where I'll store extra packages.
  normalProjectDir = "/home/shana/programming/nix-project-defaults/";
  haskellProjectDir = normalProjectDir + "haskell-tmp-defaults/";

  # Wrap callPackage with the default Haskell directories.
  haskellPackage = s: p: s.callPackage (haskellProjectDir + p) {};
  haskellPackageS = s: p: s.callPackage (haskellProjectDir + p);

  # Wrap callPackage with the default non-Haskell directories.
  normalPackage = p: callPackage (normalProjectDir + p) {};
  normalPackage32 = p: callPackage_i686 (normalProjectDir + p) {};
  normalPackageS = s: p: s.callPackage (normalProjectDir + p) {};
  normalPackageC = s: p: v: s.callPackage (normalProjectDir + p) v;
in
{ packageOverrides = self: rec {

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
      cryptohash_0_10_0 = haskellPackage se "cryptohash/0.10.0.nix";
      cryptohash        = haskellPackage se "cryptohash";
      haskoin           = haskellPackage se "haskoin";
      haddock           = normalPackageS se "haddock";
      haddockLibrary    = normalPackageS se "haddock-library";
      haddockApi        = normalPackageS se "haddock-api";
      PastePipe         = haskellPackage se "PastePipe";
      yi                = normalPackageS se "yi";
      yiContrib         = normalPackageS se "yi-contrib";
      hask              = haskellPackage se "hask";
      bittorrent        = normalPackageS se "bittorrent";
      gtk3hs            = haskellPackage se "gtk3";
      ghcMod_5_0_1_1    = haskellPackage se "ghc-mod/5.0.1.1.nix";
      djinnLib          = haskellPackage se "djinn-lib";
      djinnGhc          = haskellPackage se "djinn-ghc";
      monadJournal      = haskellPackage se "monad-journal";
      yiMonokai         = normalPackageS se "yi-monokai";
      yiHaskellUtils    = normalPackageC se "yi-haskell-utils" { ghcMod = ghcMod_5_0_1_1; };
      customisedYi      = normalPackageS se "customised-yi";
      lens              = haskellPackage se "lens";
      lensAeson         = haskellPackage se "lens-aeson";
      tsuntsun          = normalPackageS se "tsuntsun";
      wordTrie          = normalPackageS se "word-trie";
      ooPrototypes      = normalPackageS se "oo-prototypes";
      yiLanguage        = normalPackageS se "yi-language";
      yiCustom          = normalPackageS se "customised-yi";
      hstorrent         = normalPackageS se "hstorrent";
      haskellTracker    = normalPackageS se "haskell-tracker";
      saltine           = haskellPackage se "saltine";
      yiRope            = normalPackageS se "yi-rope";
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

  # Packages that aren't Haskell packages.

  wlc = normalPackage "wlc";
  loliwm = normalPackage "loliwm";
  youtubeDL = normalPackage "youtube-dl";
}; }
