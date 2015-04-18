let pkgs = import <nixpkgs> {};
    categories = pkgs.callPackage ./. {};
in categories
