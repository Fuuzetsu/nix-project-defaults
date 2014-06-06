{ haskellPackages ? (import <nixpkgs> {}).haskellPackages_ghc763
, withPango ? true }:
let
  inherit (haskellPackages) cabal cabalInstall_1_18_0_3 alex
    binary Cabal cautiousFile concreteTyperep dataDefault derive Diff
    dlist dyre filepath fingertree glib gtk hashable hint lens mtl
    pango parsec pointedlist QuickCheck_2_7_3 random regexBase regexTdfa safe
    split time transformersBase uniplate unixCompat unorderedContainers
    utf8String vty xdgBasedir tfRandom HUnit QuickCheck tasty tastyHunit
    tastyQuickcheck;

in cabal.mkDerivation (self: {
  pname = "yi";
  version = "0.8.1";
  src = /home/shana/programming/yi/yi;
  buildDepends = [
    # As imported above
    binary Cabal cautiousFile concreteTyperep dataDefault derive Diff
    dlist dyre filepath fingertree hashable hint lens mtl
    parsec pointedlist QuickCheck_2_7_3 random regexBase regexTdfa safe
    split time transformersBase uniplate unixCompat unorderedContainers
    utf8String vty xdgBasedir tfRandom
  ] ++ (if withPango then [ pango gtk glib ] else [ ]);
  buildTools = [ cabalInstall_1_18_0_3 alex ];
  testDepends = [ filepath HUnit QuickCheck tasty tastyHunit tastyQuickcheck ];

  postInstall = ''
    mv $out/bin/yi $out/bin/.yi-wrapped
    cat - > $out/bin/yi <<EOF
    #! ${self.stdenv.shell}
    # Trailing : is necessary for it to pick up Prelude &c.
    export GHC_PACKAGE_PATH=$(${self.ghc.GHCGetPackages} ${self.ghc.version} \
                              | sed 's/-package-db\ //g' \
                              | sed 's/^\ //g' \
                              | sed 's/\ /:/g')\
    :$out/lib/ghc-${self.ghc.version}/package.conf.d/yi-$version.installedconf:

    eval exec $out/bin/.yi-wrapped "\$@"
    EOF
    chmod +x $out/bin/yi
  '';
  isLibrary = true;
  isExecutable = true;
  enableSplitObjs = false;
  doCheck = false;
  noHaddock = true;
  configureFlags = [ (if withPango then "-fpango" else "-f-pango") ];
})