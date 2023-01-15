{ stdenv
, fetchzip
, enableTests ? false
}:

stdenv.mkDerivation {
  pname = "filib";
  version = "1.2";

  src = fetchzip {
    url = "https://www2.math.uni-wuppertal.de/wrswt/software/fi_lib/fi_lib-1.2.tgz";
    hash = "sha256-2U8m9ycLVFVafSjE4E6o31hyvIX6PSfMDF2mYxT1Ep4=";
  };

  doCheck = enableTests;

  postPatch = ''
    substituteInPlace Makefile \
      --replace gcc cc         \
      --replace g++ c++
  '';

  buildPhase = ''
    runHook preInstall

    make -j$NIX_BUILD_CORES all

    runHook postInstall
  '';

  checkPhase = ''
    runHook preCheck

    test/fi_test

    runHook postCheck
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/lib $out/include

    (cd example && cp hornerc comp_sin comp_exp hornercpp bisection xinewton $out/bin)
    cp fi_lib.h $out/include
    cp fi_lib.a $out/lib/libfi_lib.a

    runHook postInstall
  '';
}
