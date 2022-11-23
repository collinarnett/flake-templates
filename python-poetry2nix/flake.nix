{
  description = "A python project that uses jupyterWith";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    poetry2nix.url = "github:nix-community/poetry2nix";
  };
  outputs = {
    self,
    nixpkgs,
    poetry2nix,
  }: let
    system = "x86_64-linux";
    overlay = nixpkgs.lib.composeManyExtensions [
      poetry2nix.overlay
      (final: prev: {
        poetry-app = prev.poetry2nix.mkPoetryApplication {
          projectDir = ./.;
        };
      })
    ];
    pkgs = import nixpkgs {
      inherit system;
      overlays = [overlay];
    };
  in {
    apps.${system}.default = {
      type = "app";
      program = "${pkgs.poetry-app}/bin/poetry_app";
    };
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        (python310.withPackages (ps: with ps; [poetry black]))
      ];
    };
  };
}
