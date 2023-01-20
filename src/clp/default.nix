{ lib
, stdenv
, fetchFromGitHub
, pkg-config
, blas
, lapack
, readline
, coindatasample
, coindatanetlib
, coinutils
, osi
, glpkSupport ? false
, coinglpk
}:

stdenv.mkDerivation {
  pname = "clp";
  version = "unstable-2022-12-16";

  src = fetchFromGitHub {
    owner = "coin-or";
    repo = "Clp";
    rev = "58324f064d7d030e8b9a3828b16efc18f379f8a1";
    hash = "sha256-33dCpxuLEMlHTnS6G43L/g1h27iKhcirYWCkWl5qCRM=";
  };

  enableParallelBuilding = true;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    blas
    lapack
    readline

    coindatasample
    coindatanetlib
    (coinutils.override { inherit glpkSupport; })
    (osi.override { inherit glpkSupport; })
  ] ++ lib.optional glpkSupport [ coinglpk ];
}
