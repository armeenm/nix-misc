{
  description = "";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixpkgs-unstable;
    utils.url = github:numtide/flake-utils;
  };

  outputs = inputs@{ self, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        sets = {
          nixpkgs = import inputs.nixpkgs { inherit system; };
        };

        pkgs = sets.nixpkgs;

        inherit (pkgs) lib;
        stdenv = pkgs.stdenvNoCC;
        mkShell = pkgs.mkShell.override { inherit stdenv; };

        packages = rec {
          apbs = pkgs.callPackage ./apbs { };
          blast = pkgs.callPackage ./blast { };

          function2 = pkgs.callPackage ./function2 { };
          optional-lite = pkgs.callPackage ./optional-lite { };
          variant-lite = pkgs.callPackage ./variant-lite { };
          span-lite = pkgs.callPackage ./span-lite { };

          macoro = pkgs.callPackage ./macoro { inherit optional-lite variant-lite; };

          coproto = pkgs.callPackage ./coproto {
            inherit function2 macoro optional-lite span-lite variant-lite;
          };

          libote = pkgs.callPackage ./libote {
            inherit coproto function2 macoro optional-lite span-lite variant-lite;
          };

          concorde = pkgs.callPackage ./concorde { };
          mdspan = pkgs.callPackage ./mdspan { };
          pocketfft = pkgs.callPackage ./pocketfft { };
        };

      in {
        inherit packages;

        devShells.default = mkShell { };
      }
    );
}
