{
  description = "A simple python dev template";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };
  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    # Packages you need for your IDE
    python-lsp-utils = ps:
      with ps; [
        black
        isort
      ];

    # Packages you want in your environment (for experimentation)
    dev-packages = ps:
      with ps; [
        numpy
        pandas
      ];
    # A python package you're developing
    # python-package = pkgs.python310Packages.callPackage ./package/default.nix {};
    python-dev = pkgs.python310.withPackages (
      ps:
        dev-packages ps
        ++ python-lsp-utils ps
      # ++ [python-package]
    );
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [python-dev];
      # Other packages you want in your devshell
      # buildInputs = with pkgs; [...];
    };
  };
}
