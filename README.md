> Nix flake for declaratively managing and configuring all of my systems.

![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)
![Raspberry Pi](https://img.shields.io/badge/-Raspberry_Pi-C51A4A?style=for-the-badge&logo=Raspberry-Pi)

## Install
```bash
curl --remote-name https://raw.githubusercontent.com/samueljoli/lakay-darwin/main/scripts/init.sh
```

## Run
```bash
sh init.sh 2>&1 | tee ~/macOS-dev.log
```
> [!IMPORTANT]
> **installs**:
> - `nix` using Determinate System's [`installer`](https://github.com/DeterminateSystems/nix-installer)
> - [`nix-darwin`](https://github.com/LnL7/nix-darwin)

### See also
[`:wiki`](https://github.com/samueljoli/lakay-darwin/wiki)
