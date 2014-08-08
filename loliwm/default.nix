{ stdenv, fetchgit, cmake, libxkbcommon, wlc
, mesa, udev, libdrm, wayland, pixman, libX11
}:

stdenv.mkDerivation rec {
  pname = "loliwm";
  version = "eea015ca43af0fe7bddfa2ea58de2ebf05e478b5";
  name = pname + "-" + version;

  src = fetchgit {
    url = "https://github.com/Cloudef/loliwm.git";
    sha256 = "145pnqcrmbfkzg5yvr7q2rynl40gpy8b49nc1s5p5qng02wyy34q";
    rev = version;
    fetchSubmodules = false;
  };
  buildInputs = [ cmake wlc libxkbcommon mesa udev libdrm wayland
                  pixman libX11 ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/Cloudef/loliwm";
    description = "Wayland compositor";
    license = licenses.gpl3Plus;
    maintainers = [ maintainers.fuuzetsu ];
    platforms = platforms.linux;
  };

}