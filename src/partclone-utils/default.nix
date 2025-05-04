{ stdenv
, autoreconfHook
}:

stdenv.mkDerivation {
  pname = "partclone-utils";
  version = "unstable-2022-04-25";

  src = builtins.fetchGit {
    url = "https://git.code.sf.net/p/partclone-utils/git";
    rev = "e0389ecc4ce301fb08b1199103443b7c4b6a2ec7";
  };

  nativeBuildInputs = [
    autoreconfHook
  ];
}
