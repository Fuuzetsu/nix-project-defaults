{ stdenv, agda, fetchgit, AgdaStdlib }:

agda.mkDerivation (self: rec {
  version = "e57e4b279f3b0536113d45348448366f9317e576";
  name = "bitvector-${version}";

  src = /home/shana/programming/bitvector;

  buildDepends = [ AgdaStdlib ];

  meta = {
    homepage = "https://github.com/copumpkin/bitvector";
    description = "Sequences of bits and common operations on them";
  };
})
