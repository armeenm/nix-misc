{ lib
, stdenv
, requireFile
, autoPatchelfHook
, makeWrapper
, libGL
, xorg
, zlib
}:

let
  libs = [
    libGL
    xorg.libxcb
  ];

in stdenv.mkDerivation {
  pname = "tuxemu";
  version = "0.0.4";

  src = requireFile {
    name = "tux_emulator_linux";
    sha256 = "b447b75e0f05a38d8646f9bb48a6fe23c2188d54aea89bc70121223992944c92";
    message = ''
      You need to "nix store add-file tux_emulator_linux".
    '';
  };

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    zlib
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp $src $out/bin/tuxemu
    chmod +x $out/bin/tuxemu

    runHook postInstall
  '';

  wrapProgramFlags = [
    "--prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath libs}"
    "--set QT_QPA_PLATFORM xcb"
    "--set-default DISPLAY :0"
    "--argv0 ${placeholder "out"}/bin/.tuxemu-wrapped"
  ];

  postFixup = ''
    wrapProgram $out/bin/tuxemu ''${wrapProgramFlags[@]}
  '';
}