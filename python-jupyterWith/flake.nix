{
  description = "A python project that uses jupyterWith";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    jupyterWith.url = "github:tweag/jupyterWith";
  };
  outputs = {
    self,
    nixpkgs,
    jupyterWith,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    inherit (jupyterWith.lib.${system}) mkJupyterlabFromPath;
    jupyterlab = mkJupyterlabFromPath ./kernels {inherit system;};
  in {
    packages.${system} = {
      default = jupyterlab;
    };
    apps.${system}.default = {
      type = "app";
      program = "${jupyterlab}/bin/jupyter-lab";
    };
  };
}
