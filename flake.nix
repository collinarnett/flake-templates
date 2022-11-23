{
  description = "My personal (opinionated) collection of flake templates to help my get things done";
  outputs = {self}: {
    templates = {
      default = self.templates.blank;
      blank = {
        path = ./blank;
        description = "A blank flake template to create other templates";
      };
      python = {
        path = ./python;
        description = "Basic python template using only Nix based python development";
      };
      python-jupyterWith = {
        path = ./python-jupyterWith;
        description = "Python template created using jupyterWith";
      };
      python-poetry2nix = {
        path = ./python-poetry2nix;
        description = "Python template created using poetry2nix";
      };
    };
    
  };
}
