# Systems
> Nix flake for declaratively managing and configuring all of my systems.

![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)
![Raspberry Pi](https://img.shields.io/badge/-Raspberry_Pi-C51A4A?style=for-the-badge&logo=Raspberry-Pi)

## Install [Nix](https://github.com/DeterminateSystems/nix-installer) installer
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```
> [!NOTE]
> This enables [flakes](https://nixos.wiki/wiki/Flakes) by default

## Bootstrap
```bash
nix run github:samueljoli/systems
```

### See also
[`:wiki`](https://github.com/samueljoli/lakay-darwin/wiki)
