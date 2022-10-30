{ pkgs
, coproto
, function2
, macoro
, optional-lite
, span-lite
, variant-lite
}:

let
  inherit (pkgs) nixpkgs;
  inherit (nixpkgs) lib stdenv;

in stdenv.mkDerivation rec {
  pname = "libote";
  version = "2.0.2";

  src = nixpkgs.fetchFromGitHub {
    owner = "osu-crypto";
    repo = "libOTe";
    rev = "v${version}";
    hash = "sha256-0g4LPvyY6ljGtfA0lmjnwFJaw1i+FWJJZAp6P3/dDZc=";
    fetchSubmodules = true;
  };

  patches = lib.optional stdenv.isAarch64 [ ./arm.patch ];
  cmakeFlags = [ "-DENABLE_BITPOLYMUL=OFF" ]
               ++ (lib.optional stdenv.isAarch64 [ "-DENABLE_SSE=OFF" "-DENABLE_AVX=OFF" ]);

  nativeBuildInputs = with nixpkgs; [
    cmake
    ninja
    pkg-config
  ];

  buildInputs = [
    coproto
    function2
    macoro
    optional-lite
    span-lite
    variant-lite
  ];
}
