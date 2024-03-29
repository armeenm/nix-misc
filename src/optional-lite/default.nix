{ stdenv
, fetchFromGitHub
, cmake
, ninja
}:

stdenv.mkDerivation {
  pname = "optional-lite";
  version = "unstable-2022-10-18";

  src = fetchFromGitHub {
    owner = "martinmoene";
    repo = "optional-lite";
    rev = "7a66721b8da0affc30e43f9272a8635259562048";
    hash = "sha256-mHJw6fdwu4WNU3oS8dyxmwA5cyT4tX2rfY1Y39s9WCs=";
  };

  nativeBuildInputs = [
    cmake
    ninja
  ];
}
