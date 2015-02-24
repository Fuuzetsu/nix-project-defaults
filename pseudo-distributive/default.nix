{ stdenv, agda, fetchgit, AgdaStdlib, categories }:

agda.mkDerivation (self: rec {
  version = "0.0.0.0";
  name = "pseudo-distributive-${version}";

  src = /home/shana/programming/pseudo-distributive;

  buildDepends = [ AgdaStdlib categories ];
  sourceDirectories = [ "." ];

  meta = {
    homepage = "https://github.com/Fuuzetsu/pseudo-distributive";
    description = "Categories parametrized by morphism equality, in Agda";
    license = stdenv.lib.licenses.bsd3;
    platforms = stdenv.lib.platforms.unix;
    maintainers = with stdenv.lib.maintainers; [ fuuzetsu ];
  };
})
