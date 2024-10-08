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
    };
  };
}
