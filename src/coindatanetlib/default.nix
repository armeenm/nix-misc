{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "coindatanetlib";
  version = "unstable-2021-05-06";

  src = fetchFromGitHub {
    owner = "coin-or-tools";
    repo = "Data-Netlib";
    rev = "1857a20723b7066cb5fbcd82cf8d1580aa5038f3";
    hash = "sha256-xIe2BcYehTAv6K5E9IRX5VOKebbxbnkfZm8iMtXUZ3U=";
  };
}
