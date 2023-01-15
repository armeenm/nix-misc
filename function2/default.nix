{ stdenv
, fetchFromGitHub
, cmake
, ninja
}:

stdenv.mkDerivation {
  pname = "function2";
  version = "4.2.2";

  src = fetchFromGitHub {
    owner = "Naios";
    repo = "function2";
    rev = "4.2.2";
    hash = "sha256-i+ZxLxpmutrbZiUbeHGRGkDzqMmgjAVHU9yXpUZ/rNg=";
  };

  nativeBuildInputs = [
    cmake
    ninja
  ];

  postInstall = ''
    rm $out/LICENSE.txt $out/Readme.md
  '';
}
