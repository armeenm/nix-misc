{ lib
, stdenv
, fetchFromGitHub
, pkg-config
, blas
, lapack
, coindatasample
, glpkSupport ? false
, coinglpk
}:

stdenv.mkDerivation {
  pname = "coinutils";
  version = "unstable-2022-07-30";

  src = fetchFromGitHub {
    owner = "coin-or";
    repo = "CoinUtils";
    rev = "bbd81ae459f25ee1f665f3cc017309da5025eb81";
    hash = "sha256-zKVPvKcE2OJXQ0sjejKmSKaBIQBkx9uWTXo0CHUbNwM=";
  };

  enableParallelBuilding = true;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    blas
    lapack
    coindatasample
  ] ++ lib.optional glpkSupport [ coinglpk ];
}
