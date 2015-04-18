let pkgs = import <nixpkgs> {};
    haskell-lib = import (<nixpkgs> + "/pkgs/development/haskell-modules/lib.nix") {
      inherit pkgs;
    };
    packageSet = (pkgs.yi_packages pkgs.haskell-ng.packages.ghc7101).override {
      overrides = se : su : {
        # Build crutches
        cautious-file = haskell-lib.doJailbreak su.cautious-file;
        concrete-typerep = su.callPackage "/home/shana/programming/nix-project-defaults/haskell-tmp-defaults/concrete-typerep/default.nix" {};
      };
    };
in packageSet.callPackage ./. {}
