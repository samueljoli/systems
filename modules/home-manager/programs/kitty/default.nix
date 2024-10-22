{ pkgs }:

{
  enable = true;
  themeFile = "GruvboxMaterialDarkHard";
  shellIntegration.enableZshIntegration = true;
  extraConfig = ''
    ${builtins.readFile ./kitty.conf}
  '';
}
