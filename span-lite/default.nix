{ pkgs }:

let
  inherit (pkgs) nixpkgs;
  inherit (nixpkgs) lib;

in nixpkgs.stdenv.mkDerivation {
  pname = "span-lite";
  version = "unstable-2022-10-15";

  src = nixpkgs.fetchFromGitHub {
    owner = "martinmoene";
    repo = "span-lite";
    rev = "78129c9ad66b02c8621f697d7250f00f35e1d5c2";
    hash = "sha256-KOvUMmDlXpRnjcjxTt3ANdbYL5sV9zaAEgREt1MZ9Dk=";
  };

  nativeBuildInputs = with nixpkgs; [
    cmake
    ninja
  ];
}
