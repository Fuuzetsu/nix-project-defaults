{ pkgs }:

with pkgs;

{ #ffmpeg.x11grab = true;
  allowUnfree = true;
  firefox.enableGoogleTalkPlugin = true;
  allowTexliveBuilds = true;

  packageOverrides = self: rec {
  }; # end of packageOverrides
}
