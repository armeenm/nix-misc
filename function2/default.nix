{ pkgs }:

let
  inherit (pkgs) nixpkgs;
  inherit (nixpkgs) lib;

in nixpkgs.stdenv.mkDerivation {
  pname = "function2";
  version = "4.2.2";

  src = nixpkgs.fetchFromGitHub {
    owner = "Naios";
    repo = "function2";
    rev = "4.2.2";
    hash = "sha256-i+ZxLxpmutrbZiUbeHGRGkDzqMmgjAVHU9yXpUZ/rNg=";
  };

  nativeBuildInputs = with nixpkgs; [
    cmake
    ninja
  ];

  postInstall = ''
    rm $out/LICENSE.txt $out/Readme.md
  '';
}
