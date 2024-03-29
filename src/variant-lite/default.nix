{ stdenv
, fetchFromGitHub
, cmake
, ninja
}:

stdenv.mkDerivation {
  pname = "variant-lite";
  version = "unstable-2022-10-15";

  src = fetchFromGitHub {
    owner = "martinmoene";
    repo = "variant-lite";
    rev = "a2169288c984501a7a8c26bcab9976d9a2b82490";
    hash = "sha256-x1VSAPAfHz3BgiR08+jJgtAatcCQncrpQawFPF624Ao=";
  };

  cmakeFlags = [ "-DVARIANT_LITE_OPT_BUILD_TESTS=OFF" ];

  nativeBuildInputs = [
    cmake
    ninja
  ];
}
