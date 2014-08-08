{ stdenv, fetchgit, cmake, wlc, wayland }:

stdenv.mkDerivation rec {
  pname = "loliwm";
  version = "eea015ca43af0fe7bddfa2ea58de2ebf05e478b5";
  name = pname + "-" + version;

  src = fetchgit {
    url = "https://github.com/Cloudef/loliwm.git";
    sha256 = "0z9zdl0l8hc6zc4mdk3pirynavb3g0g0mig67l3vpis8c08479jz";
    rev = version;
    fetchSubmodules = false;
  };
  buildInputs = [ cmake wlc wayland ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/Cloudef/loliwm";
    description = "Wayland compositor";
    license = licenses.gpl3Plus;
    maintainers = [ maintainers.fuuzetsu ];
    platforms = platforms.linux;
  };

}