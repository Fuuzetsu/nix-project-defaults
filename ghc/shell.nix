let pkgs = import <nixpkgs> {};
    ghcHead = pkgs.callPackage ./. {
      ghc = pkgs.haskellPackages.ghcPlain;
      inherit (pkgs.haskellPackages) happy alex;
    };
in pkgs.lib.overrideDerivation ghcHead (attrs: {
  name = "ghc-HEAD";
  src = /home/shana/programming/ghc;
  buildInputs = [ pkgs.git ] ++ attrs.buildInputs;
})
