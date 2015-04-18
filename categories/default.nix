{ stdenv, agda, fetchgit, AgdaStdlib }:

agda.mkDerivation (self: rec {
  version = "0.0.0.0";
  name = "categories-${version}";

  src = /home/shana/programming/categories;

  buildDepends = [ AgdaStdlib ];
  sourceDirectories = [ "." ];

  meta = {
    homepage = "https://github.com/copumpkin/categories";
    description = "Categories parametrized by morphism equality, in Agda";
    license = stdenv.lib.licenses.bsd3;
    platforms = stdenv.lib.platforms.unix;
    maintainers = with stdenv.lib.maintainers; [ fuuzetsu ];
  };
})
