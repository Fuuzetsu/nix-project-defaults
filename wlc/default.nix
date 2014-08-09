{ stdenv, fetchgit, cmake, pkgconfig, wayland, pixman, libxkbcommon
, libdrm, libX11, udev, libxcb, mesa, libXext
}:

stdenv.mkDerivation rec {
  pname = "wlc";
  version = "2a95f076d9da424a5496a0b303c21f0be478d3d1";
  name = pname + "-" + version;

  src = fetchgit {
    url = "https://github.com/Cloudef/wlc.git";
    sha256 = "0kd7l52ilk4d8vq0g0is68mvjg67ag8mgrpj3wwx4vx775xfzp7x";
    rev = version;
    fetchSubmodules = false;
  };

  buildInputs = [ cmake pkgconfig wayland pixman mesa libXext
                  libxkbcommon libdrm libX11 udev libxcb
                ];

  preConfigure = ''
    sed -i "s@libX11.so@${libX11}/lib/libX11.so@g" src/backend/x11.c
    sed -i "s@libX11-xcb.so@${libX11}/lib/libX11-xcb.so@g" src/backend/x11.c
    sed -i "s@libxcb.so@${libxcb}/lib/libxcb.so@g" src/backend/x11.c
    sed -i "s@libEGL.so@/run/opengl-driver/lib/libEGL.so@g" src/context/egl.c
    sed -i "s@libGLESv2.so@/run/opengl-driver/lib/libGLESv2.so@g" src/render/gles2.c
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/Cloudef/wlc";
    description = "Wayland compositor library";
    license = licenses.mit;
    maintainers = [ maintainers.fuuzetsu ];
    platforms = platforms.linux;
  };

}