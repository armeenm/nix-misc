{ lib, stdenv
, fetchzip
, autoPatchelfHook
, bzip2
, gcc-unwrapped
, zlib
}:

stdenv.mkDerivation rec {
  pname = "blast";
  version = "2.2.26";
  
  src = fetchzip {
    url = "https://ftp.ncbi.nlm.nih.gov/blast/executables/legacy.NOTSUPPORTED/${version}/blast-${version}-x64-linux.tar.gz";
    hash = "sha256-S7NoVq7rBdnPWd7l/vyumf03zhJDLPWgb/8rhVCoog4=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ bzip2 gcc-unwrapped.lib zlib ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir $out
    mv * $out

    runHook postInstall
  '';
}
