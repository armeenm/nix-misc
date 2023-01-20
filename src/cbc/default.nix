{ lib
, stdenv
, fetchFromGitHub
, pkg-config
, blas
, lapack
, readline
, cgl
, clp
, coindatasample
, coinutils
, osi
, glpkSupport ? false
, coinglpk
}:

stdenv.mkDerivation {
  pname = "cbc";
  version = "unstable-2022-12-30";

  src = fetchFromGitHub {
    owner = "coin-or";
    repo = "Cbc";
    rev = "079e2244efde2408b25f53aafd5635a2ba32fdde";
    hash = "sha256-/cTMaM+2K5ZnzxU+/ZSa6xQxrUfF5DeH/PiD55rA2yQ=";
  };

  enableParallelBuilding = true;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    blas
    lapack
    readline

    cgl
    coindatasample
    (coinutils.override { inherit glpkSupport; })
    (osi.override { inherit glpkSupport; })
    (clp.override { inherit glpkSupport; })
  ] ++ lib.optional glpkSupport [ coinglpk ];
}
