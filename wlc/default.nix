{ stdenv, fetchgit, cmake, pkgconfig, wayland
, pixman, libxkbcommon, mesa, libdrm, libX11, udev
}:

stdenv.mkDerivation rec {
  pname = "wlc";
  version = "710819e3fccdce15d0f41791a975c672e3c1b2bc";
  name = pname + "-" + version;

  src = fetchgit {
    url = "https://github.com/Cloudef/wlc.git";
    sha256 = "145pnqcrmbfkzg5yvr7q2rynl40gpy8b49nc1s5p5qng02wyy34q";
    rev = version;
    fetchSubmodules = false;
  };

  buildInputs = [ cmake pkgconfig wayland pixman
                  libxkbcommon mesa libdrm libX11 udev
                ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/Cloudef";
    description = "Wayland compositor library";
    license = licenses.mit;
    maintainers = [ maintainers.fuuzetsu ];
    platforms = platforms.linux;
  };

}