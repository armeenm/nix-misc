{ lib, stdenv
, fetchzip
, autoPatchelfHook
, gcc-unwrapped
}:

stdenv.mkDerivation rec {
  pname = "apbs";
  version = "3.4.1";
  
  src = fetchzip {
    url = "https://github.com/Electrostatics/apbs/releases/download/v${version}/APBS-${version}.Linux.zip";
    hash = "sha256-MXGNDo8HGyup4UK9putKxjjOUpX3RWOuOfDPdaZymeE=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ gcc-unwrapped.lib ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir $out
    mv * $out

    runHook postInstall
  '';
}
