let pkgs = import <nixpkgs> {};
    pseudo-distributive = pkgs.callPackage ./. {
      categories = pkgs.callPackage /home/shana/programming/categories {};
    };
in pseudo-distributive
