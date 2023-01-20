{ lib
, stdenv
, fetchFromGitHub
, fetchzip
}:

let
  glpkVer = "4.65";
  glpkSrc = fetchzip {
    url = "mirror://gnu/glpk/glpk-${glpkVer}.tar.gz";
    hash = "sha256-eOX/XGZlkjUITUp8tawP5+YHEfcOVV0xT9hAycUQPBk=";
  };

in stdenv.mkDerivation {
  pname = "coinglpk";
  version = "unstable-2021-05-06";

  src = fetchFromGitHub {
    owner = "coin-or-tools";
    repo = "ThirdParty-Glpk";
    rev = "3c3587db13f5850a80cf61ab87f542c1df08705a";
    hash = "sha256-7ab5mTUunoRunU0kOGjqOIAdgRBXAIJmBPLdELI8OZ4=";
  };

  enableParallelBuilding = true;

  prePatch = ''
    cp -r ${glpkSrc} glpk
    chmod -R +w glpk
  '';

  postInstall = ''
    for dylibtype in so dll dylib; do
      ln -svf $out/lib/libglpk.*.$dylibtype $out/lib/libcoinglpk.$dylibtype
    done
  '';
}
