{ pkgs }:

{
  enable = true;
  autocd = false;
  autosuggestion = {
    enable = true;
  };
  enableCompletion = true;
  initExtra = (builtins.readFile ./init.sh);
}
