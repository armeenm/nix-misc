{ lib
, stdenv
, fetchFromGitHub
, pkg-config
, readline
, clp
, coindatasample
, coinutils
, osi
}:

stdenv.mkDerivation {
  pname = "cgl";
  version = "unstable-2022-11-14";

  src = fetchFromGitHub {
    owner = "coin-or";
    repo = "Cgl";
    rev = "e51300200a1f03d08b112e6c62796d6b6174f8c2";
    hash = "sha256-WYm+rjpGRMIZJnlUmr/PEs0oJmnIdhho/xnO5dOiAWE=";
  };

  enableParallelBuilding = true;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    clp
    coindatasample
    coinutils
    osi
  ];
}
