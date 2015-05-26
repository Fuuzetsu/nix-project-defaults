{ mkDerivation, aeson, base, base-compat, deepseq, directory
, filepath, hspec, interpolate, mockery, stdenv, text
, unordered-containers, yaml
}:
mkDerivation {
  pname = "hpack";
  version = "0.1.2";
  src = /home/shana/programming/hpack;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    aeson base base-compat deepseq directory filepath text
    unordered-containers yaml
  ];
  testDepends = [
    aeson base base-compat deepseq directory filepath hspec interpolate
    mockery text unordered-containers yaml
  ];
  homepage = "https://github.com/sol/hpack#readme";
  description = "An alternative format for Haskell packages";
  license = stdenv.lib.licenses.mit;
}
