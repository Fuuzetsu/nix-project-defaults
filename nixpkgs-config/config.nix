{ pkgs }:

with pkgs;
let

  nixpkgsGit = import /home/shana/programming/nixpkgs {};

  # Directories where I'll store extra packages.
  programmingDir = "/home/shana/programming/";
  normalProjectDir = programmingDir + "nix-project-defaults/";
  haskellProjectDir = normalProjectDir + "haskell-tmp-defaults/";

  # Current master fetchgitLocal is broken for repositories with
  # submodule so use the old implementation
  fetchgitLocal_old = pkgs.callPackage (normalProjectDir + "fetchgitLocal") {};

  # Wrap callPackage with the default Haskell directories.
  haskellPackage = s: p: s.callPackage (haskellProjectDir + p) {};
  haskellPackageS = s: p: s.callPackage (haskellProjectDir + p);
  normalPackage = p: callPackage (normalProjectDir + p) {};
  normalPackage32 = p: callPackage_i686 (normalProjectDir + p) {};

  # Wrap callPackage with the default non-Haskell directories.
  normalPackageS = s: p: s.callPackage (normalProjectDir + p) {};

  # Like normalPackageS but checks out a git version under programming
  normalPackageSG = s: p: pkgs.lib.overrideDerivation (normalPackageS s p)
    (attrs: { src = fetchgitLocal_old (programmingDir + p); });

  # Like normalPackageSG but looks in a subdirectory of the git
  # checkout instead.
  normalPackageSGV = s: d: p: pkgs.lib.overrideDerivation (normalPackageS s p)
    (attrs: { src = fetchgitLocal_old (programmingDir + d) + "/" + p; });

  nixpkgsTop = programmingDir + "nixpkgs/pkgs/";
  nixpkgsNorm = p: pkgs.callPackage (nixpkgsTop + p);

  nixpkgsHask = nixpkgsTop + "development/libraries/haskell/";
  nixpkgHaskell = s: p: s.callPackage (nixpkgsHask + p) {};

  buildLocally = pk: p: pk.lib.overrideDerivation p (attrs: { buildInputs = []; preferLocalBuild = true; });
  buildAllLocally = pk: pk.lib.attrsets.mapAttrs (n: v: buildLocally pk v);

  ghc7101 = pkgs.haskell-ng.packages.ghc7101;

  fakeLicense = p: pkgs.lib.overrideDerivation p (attrs: {
    preConfigure = "rm LICENSE && touch LICENSE";
  });

in
{ #ffmpeg.x11grab = true;
  allowUnfree = true;
  firefox.enableGoogleTalkPlugin = true;
  allowTexliveBuilds = true;

  packageOverrides = self: rec {

  free-taiko_packages = pkgs: pkgs.override {
    overrides = se : su : rec {
      osz-loader         = normalPackageS se "osz-loader";
    };
  };

  haddock_packages = p: p.override {
    overrides = se : su : rec {
      haddock-api        = normalPackageSGV se "haddock" "haddock-api";
      haddock-library    = normalPackageSGV se "haddock" "haddock-library";
      haddock-test       = normalPackageSGV se "haddock" "haddock-test";
      haddock            = normalPackageSG se "haddock";
    };
  };

  hspec_packages = p: p.override {
    overrides = se : su : rec {
      hspec = normalPackageS se "hspec";
      hspec-core = fakeLicense (normalPackageS se "hspec-core");
      hspec-discover = fakeLicense (normalPackageS se "hspec-discover");
      hspec-expectations = normalPackageSG se "hspec-expectations";
    };
  };

  myrapi_packages = p: p.override {
    overrides = se : su : {
      servant = haskellPackage se "servant-0.2.2";
      servant-client = haskellPackage se "servant-client-0.2.2";
    };
  };

  servant_packages = p: p.override {
    overrides = se : su : {
      servant = normalPackageS se "servant";
      servant-client = normalPackageS se "servant-client";
      servant-server = normalPackageS se "servant-server";
    };
  };

  yi_packages = p: p.override {
    overrides = se : su : {
      yi = normalPackageSG se "yi";
      yi-monokai = normalPackageSG se "yi-monokai";
      yi-language = normalPackageSG se "yi-language";
      yi-haskell-utils = normalPackageSG se "yi-haskell-utils";
      yi-rope = normalPackageSG se "yi-rope";
      #yi-snippet = normalPackageS se "yi-snippet";
      yi-fuzzy-open = normalPackageSG se "yi-fuzzy-open";
      yi-agda = normalPackageSG se "yi-agda";

      # Various crutches needed for building.

      # Needs updating for GHC 7.10.1 TypeRep
      concrete-typerep = if pkgs.stdenv.lib.versionAtLeast p.ghc.version "7.9"
            then haskellPackage se "concrete-typerep"
            else su.concrete-typerep;

    };
  };

  general_packages = p: p.override {
    overrides = se : su : rec {
      cabal2nix = normalPackageS se "cabal2nix";
    };
  };
/*
  ghc7102-local =
    let haskell-packages = pkgs.haskell.packages.ghc7102;
    in haskell-packages.override {
      ghc = pkgs.lib.overrideDerivation haskell-packages.ghc (attrs: {
        name = "ghc-7.10.2-git";
        src = (programmingDir + "ghc");
        preConfigure = "perl boot\n" + attrs.preConfigure;
      });
    };
*/
  wlc = normalPackage "wlc";
  loliwm = normalPackage "loliwm";
  youtubeDL = normalPackage "youtube-dl";

  yi-custom = pkgs.yi.override {
    haskellPackages = yi_packages ghc7101;
    extraPackages = p: with p; [ lens yi-fuzzy-open yi-monokai yi-snippet ];
  };

  ncsvc = pkgs.callPackage_i686 ../ncsvc { };

  }; # end of packageOverrides
}
