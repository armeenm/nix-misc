{ pkgs }:

let
  callPackage = pkgs.lib.callPackageWith pkgs;
in rec {
  apbs = callPackage ./apbs { };
  blast = callPackage ./blast { };

  function2 = callPackage ./function2 { };
  optional-lite = callPackage ./optional-lite { };
  variant-lite = callPackage ./variant-lite { };
  span-lite = callPackage ./span-lite { };

  macoro = callPackage ./macoro { inherit optional-lite variant-lite; };

  coproto = callPackage ./coproto {
    inherit function2 macoro optional-lite span-lite variant-lite;
  };

  libote = callPackage ./libote {
    inherit coproto function2 macoro optional-lite span-lite variant-lite;
  };

  concorde = callPackage ./concorde { };
  mdspan = callPackage ./mdspan { };
  pocketfft = callPackage ./pocketfft { };
  filib = callPackage ./filib { };

  coindatasample = callPackage ./coindatasample { };
  coindatanetlib = callPackage ./coindatanetlib { };

  coinglpk = callPackage ./coinglpk { };
  coinutils = callPackage ./coinutils { inherit coindatasample coinglpk; };

  osi = callPackage ./osi {
    inherit coindatasample coindatanetlib coinglpk coinutils;
  };

  clp = callPackage ./clp {
    inherit coindatasample coindatanetlib coinglpk coinutils osi;
  };

  cgl = callPackage ./cgl {
    inherit coindatasample coinutils osi clp;
  };

  cbc = callPackage ./cbc {
    inherit coindatasample coinglpk coinutils osi clp cgl;
  };

  make380 = callPackage ./make380 { };
  qemu15 = callPackage ./qemu15 { };

  tuxemu = callPackage ./tuxemu { };

  git-fuzzy = callPackage ./git-fuzzy { };

  partclone-utils = callPackage ./partclone-utils { };
}
