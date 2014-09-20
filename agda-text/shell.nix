let pkgs = import /home/shana/programming/nixpkgs {};
    agdaText = pkgs.callPackage ./. {};
in agdaText
