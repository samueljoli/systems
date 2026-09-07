{
  inputs,
  username,
  ...
}:
rec {
  hostname = "tpi-node1";
  system = "aarch64-linux";
  isDarwin = false;
  # ponytail: stub to prove nixosConfigurations output shape; real modules land next.
  mkOutputs = inputs: {
    nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs username hostname;
      };
      modules = [
        (
          { ... }:
          {
            networking.hostName = hostname;
            system.stateVersion = "24.11";
            users.users.${username} = {
              isNormalUser = true;
              extraGroups = [ "wheel" ];
            };
            fileSystems."/" = {
              device = "/dev/disk/by-label/nixos";
              fsType = "ext4";
            };
            boot.loader.grub.enable = false;
          }
        )
      ];
    };
  };
}
