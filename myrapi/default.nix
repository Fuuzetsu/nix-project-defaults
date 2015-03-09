{ mkDerivation, aeson, base, base64-bytestring, byteable
, bytestring, cryptohash, either, http-types, old-locale
, optparse-applicative, servant, servant-client, stdenv, text, time
, transformers
}:
mkDerivation {
  pname = "myrapi";
  version = "0.1.0.0";
  src = /home/shana/programming/myrapi;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    aeson base base64-bytestring byteable bytestring cryptohash either
    http-types old-locale optparse-applicative servant servant-client
    text time transformers
  ];
  license = stdenv.lib.licenses.mit;
}
