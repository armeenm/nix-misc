{ pkgs
, enableTests ? false
}:

let
  inherit (pkgs) nixpkgs;
  inherit (nixpkgs) lib stdenv;

in stdenv.mkDerivation {
  pname = "mdspan";
  version = "0.5.0";

  src = nixpkgs.fetchFromGitHub {
    owner = "kokkos";
    repo = "mdspan";
    rev = "mdspan-0.5.0";
    hash = "sha256-sYXgUaQZfG7kBZtD2ABkTveiknB8Y07U3BZE+8QD8pQ=";
  };

  nativeBuildInputs = with nixpkgs; [
    cmake
  ];
}
