{ mkDerivation, aeson, aeson-qq, base, base-compat, deepseq
, directory, filepath, Glob, hspec, interpolate, mockery, stdenv
, text, unordered-containers, yaml
}:
mkDerivation {
  pname = "hpack";
  version = "0.4.0";
  src = /home/shana/programming/hpack;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    aeson base base-compat deepseq directory filepath Glob text
    unordered-containers yaml
  ];
  testDepends = [
    aeson aeson-qq base base-compat deepseq directory filepath Glob
    hspec interpolate mockery text unordered-containers yaml
  ];
  homepage = "https://github.com/sol/hpack#readme";
  description = "An alternative format for Haskell packages";
  license = stdenv.lib.licenses.mit;
}
