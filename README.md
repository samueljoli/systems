<h1 align="center">
  <p align="center">Systems 🪐</p>
</h1>

<p align="center"><a href="https://golang.org/">Nix</a> flake for declaratively managing and configuring my systems.</p>

---

![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)

## Bootstraping

> [!NOTE]
> The prerequisites are [Determinate Systems](https://determinate.systems/) [Nix](https://docs.determinate.systems/determinate-nix/) and [direnv](https://direnv.net/).

**Run this on a new machine:**

```bash
nix run github:samueljoli/systems#machine-name
```

> run `just machines` to list available host machines

This builds and activates the macOS system configuration, applies the Home Manager configuration,
and installs the configured Homebrew packages and applications.

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

The machine hostname becomes both the Darwin configuration name and the bootstrap command name.

## Development environment

This repository uses [direnv](https://direnv.net/) to load the Nix development shell automatically through `.envrc`.

When you first enter the repository, allow direnv:

```bash
direnv allow
```

After that, direnv loads the development environment automatically whenever you enter the directory. It provides tools used to work on this repository, including `just`, `nixfmt`, Nix and Lua language servers, Node.js, and TypeScript tooling.

