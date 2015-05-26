{ mkDerivation, base, binary, bytestring, concrete-typerep
, hashable, stdenv, unordered-containers
}:
mkDerivation {
  pname = "dynamic-state";
  version = "0.1.1.0";
  src = /home/shana/programming/dynamic-state;
  buildDepends = [
    base binary bytestring concrete-typerep hashable
    unordered-containers
  ];
  description = "Optionally serializable dynamic state keyed by type";
  license = stdenv.lib.licenses.gpl2;
}
