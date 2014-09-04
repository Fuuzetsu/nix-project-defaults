let pkgs = import /home/shana/programming/nixpkgs {};
    bitvector = pkgs.callPackage ./. {};
in bitvector