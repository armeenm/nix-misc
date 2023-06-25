{
  description = "Various Nix packages";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixpkgs-unstable;
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      config = {
        allowUnfree = true;
      };

      forAllSystems = f: nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ] (system: f system (import nixpkgs { inherit system config; }));

    in {
      packages = forAllSystems (_: pkgs: import ./src { inherit pkgs; });

      devShells = forAllSystems (_: pkgs: with pkgs; {
        default = mkShell {
          packages = [];
        };
      });
    };
}
