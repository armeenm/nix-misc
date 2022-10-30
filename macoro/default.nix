{ pkgs, optional-lite, variant-lite }:

let
  inherit (pkgs) nixpkgs;
  inherit (nixpkgs) lib;

in nixpkgs.stdenv.mkDerivation {
  pname = "macoro";
  version = "unstable-2022-09-28";

  src = nixpkgs.fetchFromGitHub {
    owner = "ladnir";
    repo = "macoro";
    rev = "139c25f6fb362a8a7cfaff7137886b1f7f770a3d";
    hash = "sha256-p5qQAlNxWZ0pyG8BF07jupj0KnQVyeGJ9XDLZMFsO5Y=";
  };

  nativeBuildInputs = with nixpkgs; [
    cmake
    ninja
  ];

  buildInputs = [
    optional-lite
    variant-lite
  ];
}
