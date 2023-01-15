{ stdenv
, fetchFromGitHub
, cmake
, ninja
}:

stdenv.mkDerivation {
  pname = "span-lite";
  version = "unstable-2022-10-15";

  src = fetchFromGitHub {
    owner = "martinmoene";
    repo = "span-lite";
    rev = "78129c9ad66b02c8621f697d7250f00f35e1d5c2";
    hash = "sha256-KOvUMmDlXpRnjcjxTt3ANdbYL5sV9zaAEgREt1MZ9Dk=";
  };

  nativeBuildInputs = [
    cmake
    ninja
  ];
}
