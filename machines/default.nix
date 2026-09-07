{
  inputs,
  username,
  system,
}:
let
  lakay = import ./lakay {
    inherit inputs;
    inherit username;
    inherit system;
  };
  tpi-node1 = import ./tpi-node1 {
    inherit inputs;
    inherit username;
  };

  hosts = [
    lakay
    tpi-node1
  ];
in
{
  forEach = callback: builtins.foldl' (acc: machine: acc // callback machine) { } hosts;
  darwinHosts = builtins.filter (m: m.isDarwin or false) hosts;
}
