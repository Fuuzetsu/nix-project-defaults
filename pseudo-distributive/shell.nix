let pkgs = import <nixpkgs> {};
    pseudo-distributive = pkgs.callPackage ./. {};
in pseudo-distributive
