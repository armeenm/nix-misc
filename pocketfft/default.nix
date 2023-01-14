{ pkgs }:

let
  inherit (pkgs) nixpkgs;
  inherit (nixpkgs) lib stdenv;

in stdenv.mkDerivation {
  pname = "pocketfft";
  version = "unstable-2021-03-12";

  src = nixpkgs.fetchFromGitHub {
    owner = "hayguen";
    repo = "pocketfft";
    rev = "ea778e37710c07723435b1be58235996d1d43a5a";
    hash = "sha256-g0my22ILjZhmRpftEWvju5i4nDYTFv491/rpdK4G42k=";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/include
    cp pocketfft_hdronly.h $out/include/

    runHook postInstall
  '';
}
