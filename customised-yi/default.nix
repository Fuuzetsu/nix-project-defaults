{ cabal, yiMonokai, yiHaskellUtils, yi, lens, yiContrib }:
let
  extras = [ yiMonokai lens yiContrib yiHaskellUtils ];

in
cabal.mkDerivation (self: rec {
  pname = "yi-custom";
  version = "0.0.0.1";
  src = "/home/shana/.config/yi";
  isExecutable = true;
  buildDepends = extras ++ [ yi ];

  # Allows Yi to find the libraries it needs at runtime.
  postInstall = ''
    mv $out/bin/yi-custom $out/bin/.yi-wrapped
    cat - > $out/bin/yi <<EOF
    #! ${self.stdenv.shell}
    # Trailing : is necessary for it to pick up Prelude &c.
    export GHC_PACKAGE_PATH=$(${self.ghc.GHCGetPackages} ${self.ghc.version} \
                             | sed 's/-package-db\ //g' \
                             | sed 's/^\ //g' \
                             | sed 's/\ /:/g')\
    :
    eval exec $out/bin/.yi-wrapped "\$@"
    EOF
    chmod +x $out/bin/yi
  '';

})