{ stdenv, agda, fetchgit, AgdaStdlib, bitvector, categories }:

agda.mkDerivation (self: rec {
  version = "0.1.0.0";
  name = "agda-text-${version}";

  src = /home/shana/programming/agda-text;

  buildDepends = [ AgdaStdlib bitvector categories ];
  topSourceDirectories = [ "src" ];

  meta = {
    platforms = stdenv.lib.platforms.unix;
    maintainers = with stdenv.lib.maintainers; [ fuuzetsu ];
  };
})
