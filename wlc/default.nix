{ stdenv, fetchgit, cmake, pkgconfig, wayland, pixman, libxkbcommon
, mesa, libdrm, libX11, udev, libxcb
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
                  libxkbcommon mesa libdrm libX11 udev libxcb
                ];

  preConfigure = ''
    sed -i "s@libX11.so@${libX11}/lib/libX11.so@g" src/backend/x11.c
    sed -i "s@libX11-xcb.so@${libX11}/lib/libX11-xcb.so@g" src/backend/x11.c
    sed -i "s@libxcb.so@${libxcb}/lib/libxcb.so@g" src/backend/x11.c
    #sed -i "s@libEGL.so@${mesa}/lib/libEGL.so@g" src/context/egl.c
    #sed -i "s@libGLESv2.so@${mesa}/lib/libGLESv2.so@g" src/render/gles2.c
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/Cloudef/wlc";
    description = "Wayland compositor library";
    license = licenses.mit;
    maintainers = [ maintainers.fuuzetsu ];
    platforms = platforms.linux;
  };

}