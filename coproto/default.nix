{ pkgs
, function2
, macoro
, optional-lite
, span-lite
, variant-lite
}:

let
  inherit (pkgs) nixpkgs;
  inherit (nixpkgs) lib;

in nixpkgs.stdenv.mkDerivation {
  pname = "coproto";
  version = "unstable-2022-09-28";

  src = nixpkgs.fetchFromGitHub {
    owner = "Visa-Research";
    repo = "coproto";
    rev = "cb0be43b4f273b403479740bf9e22600a6656af7";
    hash = "sha256-KrHVJ799Kjqsru+k3jVa/Ur4BTXUf+jvcbJ55LwUeWA=";
  };

  nativeBuildInputs = with nixpkgs; [
    cmake
    ninja
  ];

  buildInputs = [
    function2
    macoro
    optional-lite
    span-lite
    variant-lite
  ];
}
