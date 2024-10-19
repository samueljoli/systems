{ inputs, username, system }:
let
  lakay = import ./lakay {
    inherit inputs;
    inherit username;
    inherit system;
  };

  hosts = [
    lakay
  ];
in
{
  forEach = callback:
    builtins.foldl' (acc: machine: acc // callback machine) {} hosts;
}
