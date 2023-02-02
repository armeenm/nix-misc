{ lib
, stdenv
, fetchzip
, bison
, flex
, perl
, pkg-config
, python2
, alsa-lib
, attr
, glib
, libcap
, libuuid
, ncurses
, pixman
, texinfo
, vde2
, zlib
}:

stdenv.mkDerivation rec {
  pname = "qemu";
  version = "1.5.2";

  src = fetchzip {
    url = "http://wiki.qemu.org/download/qemu-${version}.tar.bz2";
    hash = "sha256-Mhs7H6Seygd5uRUs56okq+SV7GVSGs6i3svkyV1Lnj8=";
  };

  patches = [
    ./dtc.patch
    ./sysmacros.patch
  ];

  nativeBuildInputs = [
    bison
    flex
    perl
    pkg-config
    python2
    texinfo
  ];

  buildInputs = [
    alsa-lib.dev
    attr.dev
    glib.dev
    libcap.dev
    libuuid.dev
    ncurses.dev
    pixman
    vde2
    zlib.dev
  ];

  enableParallelBuilding = true;

  configureFlags = [
    "--audio-drv-list=alsa"
    "--smbd=smbd" # use `smbd' from $PATH
    "--target-list=i386-softmmu,x86_64-softmmu"
  ];

  preBuild = "echo $ARFLAGS";
}
