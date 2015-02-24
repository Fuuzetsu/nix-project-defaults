let pkgs = import <nixpkgs> {};
    myHaskellPackages = pkgs.myHaskellngPackages_784;
in myHaskellPackages.callPackage ./. {}
