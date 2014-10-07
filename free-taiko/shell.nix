let pkgs = import <nixpkgs> {};
    nixpkgsH = (import /home/shana/programming/nixpkgs {}).haskellPackages ;
    myHaskellPackages = pkgs.myHaskellPackages;
    haskellPackages = myHaskellPackages.override {
      extension = self: super: {
        freeTaiko = myHaskellPackages.callPackage ./. {};
      };
    };
in pkgs.lib.overrideDerivation haskellPackages.freeTaiko (attrs: {
  noHaddock = true;
  buildInputs = [ ] ++ attrs.buildInputs;
})
