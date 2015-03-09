{ mkDerivation, aeson, attoparsec, base, bytestring, deepseq
, either, exceptions, hspec, http-client, http-client-tls
, http-types, network, network-uri, QuickCheck, safe, servant
, servant-server, stdenv, string-conversions, text, transformers
, wai, warp
}:
mkDerivation {
  pname = "servant-client";
  version = "0.2.2";
  sha256 = "0b96aglic4aawdcpaxyv9k807kjfrr0a9kniqgj5nfcpgwglnp5r";
  buildDepends = [
    aeson attoparsec base bytestring either exceptions http-client
    http-client-tls http-types network-uri safe servant
    string-conversions text transformers
  ];
  testDepends = [
    aeson base bytestring deepseq either hspec http-types network
    QuickCheck servant servant-server wai warp
  ];
  homepage = "http://haskell-servant.github.io/";
  description = "automatical derivation of querying functions for servant webservices";
  license = stdenv.lib.licenses.bsd3;
}
