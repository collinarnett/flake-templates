{
  name,
  availableKernels,
  extraArgs,
}:
availableKernels.python {
  projectDir = ./.;
  displayName = "Python with Matplotlib 3.5.x";
  name = "my-python-with-matplotlib";
}
