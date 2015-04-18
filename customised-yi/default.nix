{ stdenv, makeWrapper
, haskellPackages
, extraPackages ? (s: [])
}:
let
  yiEnv = haskellPackages.ghcWithPackages
    (self: [ self.yi ] ++ extraPackages self);
in
stdenv.mkDerivation {
  name = "yi-custom";
  version = "0.0.0.1";
  unpackPhase = "true";
  nativeBuildInputs = [ makeWrapper ];

  buildCommand = ''
    mkdir -p $out/bin
    makeWrapper ${haskellPackages.yi}/bin/yi $out/bin/yi \
      --set NIX_GHC ${yiEnv}/bin/ghc
  '';
}
