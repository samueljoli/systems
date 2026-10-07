<h1 align="center">
  <p align="center">Systems 🪐</p>
</h1>

<p align="center"><a href="https://golang.org/">Nix</a> flake for declaratively managing and configuring my systems.</p>

---

![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)

## Install [Determinate Nix](https://github.com/DeterminateSystems/nix-installer):

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

> [!NOTE]
> Determinate Nix enables [flakes](https://nixos.wiki/wiki/Flakes) by default and
> manages the Nix installation. Open a new shell after installation if `nix` is
> not yet available.

## Bootstrap

Run this once on the new Mac:

```bash
nix run github:samueljoli/systems#lakay-air
```

The command builds and activates the nix-darwin system configuration, then
activates the user-level Home Manager configuration. It also installs the
configured Homebrew formulae and casks.

To bootstrap a checkout instead of the GitHub revision:

```bash
SYSTEMS_FLAKE=/path/to/systems nix run .#lakay-air
```

### See also

[Wiki](https://github.com/samueljoli/systems/wiki)
