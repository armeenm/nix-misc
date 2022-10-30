{
  description = "";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixpkgs-unstable;
    utils.url = github:numtide/flake-utils;
  };

  outputs = inputs@{ self, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = {
          nixpkgs = import inputs.nixpkgs {
            inherit system;
          };
        };

        inherit (pkgs.nixpkgs) lib;
        stdenv = pkgs.nixpkgs.stdenvNoCC;
        mkShell = pkgs.nixpkgs.mkShell.override { inherit stdenv; };

        packages = rec {
          apbs = pkgs.nixpkgs.callPackage ./apbs { };
          blast = pkgs.nixpkgs.callPackage ./blast { };
          function2 = import ./function2 { inherit pkgs; };
          macoro = import ./macoro { inherit pkgs optional-lite variant-lite; };
          optional-lite = import ./optional-lite { inherit pkgs; };
          span-lite = import ./span-lite { inherit pkgs; };
          variant-lite = import ./variant-lite { inherit pkgs; };

          libote = import ./libote {
            inherit pkgs coproto function2 macoro optional-lite span-lite variant-lite;
          };

          coproto = import ./coproto {
            inherit pkgs function2 macoro optional-lite span-lite variant-lite;
          };
        };

      in {
        inherit packages;

        devShells.default = mkShell { };
      }
    );
}
