{ pkgs, ... }:

let
  generateApp =
    machine:
    let
      bootstrapScript = builtins.replaceStrings [ "@machine@" ] [ machine.hostname ] (
        builtins.readFile ../scripts/bootstrap.sh
      );
      bootstrap = pkgs.writeShellScriptBin "bootstrap" bootstrapScript;
    in
    {
      ${machine.hostname} = {
        type = "app";
        program = "${bootstrap}/bin/bootstrap";
      };
    };

in
{
  inherit generateApp;
}
