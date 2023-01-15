{ stdenv
, cmake
, fetchFromGitHub
, enableTests ? false
}:

stdenv.mkDerivation {
  pname = "mdspan";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "kokkos";
    repo = "mdspan";
    rev = "mdspan-0.5.0";
    hash = "sha256-sYXgUaQZfG7kBZtD2ABkTveiknB8Y07U3BZE+8QD8pQ=";
  };

  nativeBuildInputs = [ cmake ];
}
