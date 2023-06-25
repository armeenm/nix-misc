{ lib
, stdenv
, fetchFromGitHub
, makeWrapper
, bc
}:

let
  deps = [
    bc
  ];

in stdenv.mkDerivation {
  pname = "git-fuzzy";
  version = "unstable-2023-03-16";

  src = fetchFromGitHub {
    owner = "bigH";
    repo = "git-fuzzy";
    rev = "c3daa2e79b9690c29af5b9b2afab34f4386753c8";
    hash = "sha256-wT39U4X5A+pm8krPKRV4w4DYOpQ26HHdvpZs+D6e5Ms=";
  };

  nativeBuildInputs = [ makeWrapper ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir $out
    cp -r bin lib $out/

    wrapProgram $out/bin/git-fuzzy \
                --prefix PATH : ${lib.makeBinPath deps}

    runHook postInstall
  '';
}
