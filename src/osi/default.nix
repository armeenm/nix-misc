{ lib
, stdenv
, fetchFromGitHub
, pkg-config
, coindatasample
, coindatanetlib
, coinutils
, glpkSupport ? false
, coinglpk
}:

stdenv.mkDerivation {
  pname = "osi";
  version = "unstable-2023-01-11";

  src = fetchFromGitHub {
    owner = "coin-or";
    repo = "Osi";
    rev = "1f92bf98a1d373d9e8928aa7242496291a7b2b0b";
    hash = "sha256-xE/49idwqZTibl7wBS6OUmyxo/DE9yKeoPft6ChZnis=";
  };

  enableParallelBuilding = true;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    coindatasample
    coindatanetlib
    (coinutils.override { inherit glpkSupport; })
  ] ++ lib.optional glpkSupport [ coinglpk ];
}
