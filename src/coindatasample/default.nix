{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "coindatasample";
  version = "unstable-2021-05-06";

  src = fetchFromGitHub {
    owner = "coin-or-tools";
    repo = "Data-Sample";
    rev = "833bd746eda4c48d7b3ef411a332178630063725";
    hash = "sha256-8duS9hGDjxGbpjI8F/6cyjcn0KTWiIldbEfjmFsJeJQ=";
  };
}
