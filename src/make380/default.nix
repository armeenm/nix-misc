{ stdenv
, gcc49Stdenv
, fetchzip
}:

stdenv.mkDerivation {
  pname = "gnumake";
  version = "3.80";

  src = fetchzip {
    url = "https://ftp.gnu.org/gnu/make/make-3.80.tar.bz2";
    hash = "sha256-caoWvLj8EK0End+Iioiwy1uxVQoRyAlpcscX1Hi7GBQ=";
  };

  hardeningDisable = [ "format" ];

  patches = [ ./log.diff ];

  postPatch = ''
    sed -i 's/__alloca/alloca/g' **/*.c
    sed -i 's/__stat/stat/g' **/*.c
  '';
}
