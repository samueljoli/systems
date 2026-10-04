{ pkgs }:

{
  enable = true;
  autocd = false;
  autosuggestion = {
    enable = true;
  };
  enableCompletion = true;
  initContent = (builtins.readFile ./init.sh);
}
