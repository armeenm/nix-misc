{ pkgs }:

let
  inherit (pkgs) nixpkgs;
  inherit (nixpkgs) lib stdenv;

in stdenv.mkDerivation {
  pname = "concorde";
  version = "unstable-2003-12-19";

  src = nixpkgs.fetchzip {
    url = "https://www.math.uwaterloo.ca/tsp/concorde/downloads/codes/src/co031219.tgz";
    hash = "sha256-vQQrM6DC9fxylrGi1cEmHm84MpqSZnlUwkUBgwILxUg=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/lib $out/include

    cp TSP/concorde LINKERN/linkern EDGEGEN/edgegen FMATCH/fmatch $out/bin
    cp concorde.a $out/lib
    cp concorde.h $out/include

    runHook postInstall
  '';
}
