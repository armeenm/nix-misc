{
  description = "";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixpkgs-unstable;
    utils.url = github:numtide/flake-utils;
  };

  outputs = inputs@{ self, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        sets = with inputs; {
          nixpkgs = import nixpkgs { inherit system; };
        };

        pkgs = sets.nixpkgs;

        inherit (pkgs) callPackage lib stdenv mkShell;

        packages = rec {
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
        };

      in {
        inherit pkgs packages;

        devShells.default = mkShell { };
      }
    );
}
