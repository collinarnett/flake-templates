{
  description = "A blank flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      perSystem = {
        pkgs,
        self',
        ...
      }: {
        # Usually these are not needed for my most basic projects
        # packages.default = pkgs.hello;
        # apps.default = {
        #   type = "app";
        #   program = "${self'.packages.default}/bin/hello";
        # };
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # language servers, tools etc.
          ];
        };
      };
    };
}
