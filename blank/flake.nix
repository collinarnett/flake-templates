{
  description = "A blank flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };
  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
      default = pkgs.hello;
    };
    apps.${system}.default = {
      type = "app";
      program = "${self.packages.${system}.default}/bin/hello";
    };
  };
}
