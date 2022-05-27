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
          default = apbs;
          apbs = pkgs.nix.callPackage ./apbs.nix { };
        };

      in {
        inherit packages;

        devShell = mkShell {
          packages = with pkgs.nix; [
          ];
        };
      }
    );
}
