<h1 align="center">
  <p align="center">Systems 🪐</p>
</h1>

<p align="center"><a href="https://nixos.org/">Nix</a> flake for declaratively managing and configuring my systems.</p>

---

![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)

## Install [Determinate Nix](https://github.com/DeterminateSystems/nix-installer)

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

> [!NOTE]
> Determinate Nix enables [flakes](https://nixos.wiki/wiki/Flakes) by default and manages the Nix installation. Open a new shell after installation if `nix` is not yet available. Bootstrapping requires an Apple Silicon Mac and administrator access for `sudo`. [direnv](https://direnv.net/) is optional and provides automatic access to the development environment.

## Bootstrap

Run this on a new Mac:

```bash
nix run github:samueljoli/systems#machine-name
```

> Run `just machines` to list available host machines.

This builds and activates the macOS system configuration, applies the Home Manager configuration, and installs the configured Homebrew packages and applications.

To bootstrap a checkout instead of the GitHub revision:

```bash
nix run .#machine-name
```

From another directory, point the command at a local checkout with:

```bash
SYSTEMS_FLAKE=/path/to/systems nix run .#machine-name
```

The machine hostname becomes both the Darwin configuration name and the bootstrap command name.

## Configuration model

Machine definitions compose reusable Darwin and Home Manager modules. Shared configuration lives in `modules/`, while machine-specific differences live in `machines/`.

This keeps configuration reusable as more machines are added. A machine selects the modules it needs instead of copying the complete configuration from another machine.

## Adding a machine

To add another Mac:

1. Create a directory under `machines/`.
2. Add a machine definition based on `machines/lakay/`.
3. Select the shared Darwin and Home Manager modules.
4. Add only machine-specific settings to that machine's directory.
5. Register the machine in `machines/default.nix`.
6. Bootstrap it with its flake application:

```bash
nix run .#machine-name
```

## Standalone Neovim application

The Neovim configuration is also exposed as an independent flake package. Run it
without activating the complete system configuration with:

```bash
nix run .#neovim
```

The standalone package includes the Nix-pinned plugins, Tree-sitter grammars,
language servers, formatters, and command-line tools used by the configuration.
The Home Manager configuration and the standalone package share the same Lua and
plugin definitions.

## Development environment

This repository uses [direnv](https://direnv.net/) to load the Nix development shell automatically through `.envrc`.

When you first enter the repository, allow direnv:

```bash
direnv allow
```

After that, direnv loads the development environment automatically whenever you enter the directory. It provides tools used to work on this repository, including `just`, `nixfmt`, Nix and Lua language servers, Node.js, and TypeScript tooling.

If you do not use direnv, enter the same environment manually with:

```bash
nix develop
```

## See also

[Wiki](https://github.com/samueljoli/systems/wiki)
