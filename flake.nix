{
  description = "";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs;
    utils.url = github:numtide/flake-utils;
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    inputs.utils.lib.eachDefaultSystem (system:
      let
        pkgs.nix = import nixpkgs {
          inherit system;
        };
        lib = pkgs.nix.lib;

        stdenv = pkgs.nix.stdenvNoCC;
        mkShell = pkgs.nix.mkShell.override { inherit stdenv; };

        packages = rec {
          apbs = pkgs.nix.callPackage ./apbs { };
          blast = pkgs.nix.callPackage ./blast { };
        };

      in {
        inherit packages;

        devShell = mkShell { };
      }
    );
}
