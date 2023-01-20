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
        inherit (pkgs) mkShell;

        packages = import ./src { inherit pkgs; };

      in {
        inherit pkgs packages;

        devShells.default = mkShell { };
      }
    );
}
