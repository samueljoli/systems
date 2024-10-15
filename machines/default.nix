{ inputs, userName }:
let
  lakay = import ./lakay {
    inherit inputs;
    inherit userName;
  };

  hosts = [
    lakay
  ];
in
{
  forEach = callback:
    builtins.foldl' (acc: machine: acc // callback machine) {} hosts;
}
