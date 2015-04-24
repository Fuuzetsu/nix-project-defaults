{ stdenv, agda, fetchgit, AgdaStdlib, categories, texLiveFull }:

agda.mkDerivation (self: rec {
  version = "0.0.0.0";
  name = "pseudo-distributive-${version}";

  src = /home/shana/programming/pseudo-distributive;

  buildDepends = [ AgdaStdlib categories texLiveFull ];
  sourceDirectories = [ "." ];

  meta = {
    homepage = "https://github.com/Fuuzetsu/pseudo-distributive";
    description = "Pseudo-distributive laws";
    license = stdenv.lib.licenses.bsd3;
    platforms = stdenv.lib.platforms.unix;
    maintainers = with stdenv.lib.maintainers; [ fuuzetsu ];
  };
})
