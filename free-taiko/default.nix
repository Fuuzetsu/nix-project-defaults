{ mkDerivation, base, bytestring, call, containers, data-default
, directory, filepath, lens, mtl, osz-loader, pointedlist, stdenv
, system-filepath, text, time, transformers, unix-time, vector
, zip-archive
}:
mkDerivation {
  pname = "free-taiko";
  version = "0.0.0.0";
  src = /home/shana/programming/free-taiko;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    base bytestring call containers data-default directory filepath
    lens mtl osz-loader pointedlist system-filepath text time
    transformers unix-time vector zip-archive
  ];
  homepage = "https://github.com/Fuuzetsu/free-taiko";
  description = "Free software implementation of osu! taiko mode";
  license = stdenv.lib.licenses.gpl3;
}
