{
  inputs,
  username,
  ...
}:
rec {
  hostname = "tpi-node1";
  system = "aarch64-linux";
  isDarwin = false;
  mkOutputs = inputs: {
    nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs username hostname;
      };
      modules = [
        "${inputs.nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
        inputs.nixos-hardware.nixosModules.raspberry-pi-4
        ../../modules/nixos/common.nix
        ../../modules/nixos/ssh.nix
        ../../modules/nixos/tailscale.nix
        ../../modules/nixos/netdata.nix
        ../../modules/nixos/lab-tools.nix
        (
          { ... }:
          {
            networking.hostName = hostname;
            system.stateVersion = "24.11";
          }
        )
      ];
    };
  };
}
