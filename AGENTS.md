# AI Agent Guidelines for Dotfiles

This repository contains declarative NixOS and Home Manager configurations using Nix Flakes.

## Project Structure

```text
Dotfiles/
├── flake.nix                       # Flake entrypoint (inputs: nixpkgs-unstable, home-manager, sops-nix)
├── flake.lock                      # Flake lockfile
├── .sops.yaml                      # SOPS encryption keys and path rules
├── AGENTS.md                       # Guidelines for AI assistants
├── hosts/                          # Machine-specific host configurations
│   └── laptop/
│       ├── default.nix             # Host definition (imports hardware, core, desktop)
│       └── hardware-configuration.nix
├── modules/                        # System-level NixOS modules
│   ├── core/
│   │   ├── default.nix             # Base system aggregator
│   │   ├── nix.nix                 # Nix daemon settings, GC, store optimization
│   │   ├── boot.nix                # Limine bootloader, kernel
│   │   ├── security.nix            # Polkit, RTKit, sudo
│   │   ├── network.nix             # NetworkManager
│   │   ├── sound.nix               # PipeWire
│   │   ├── locale.nix              # Timezone, locales
│   │   ├── fonts.nix               # System fonts (Iosevka, JetBrainsMono, Inter, fontconfig)
│   │   ├── users.nix               # User accounts
│   │   └── packages.nix            # System packages
│   └── desktop/
│       └── plasma.nix              # Desktop environment (SDDM, KDE Plasma 6)
├── home/                           # User-level Home Manager configurations
│   └── arlecchino/
│       └── default.nix             # User packages, git, ssh, shell configs
└── secrets/                        # Encrypted secret files managed by sops-nix
```

## Rules and Conventions

### 1. Code Style
- **No Comments**: Do not write comments in `.nix` configuration files unless explicitly requested by the user. The code must remain clean, concise, and self-documenting.
- **Consistent Indentation**: Use 2 spaces for indentation.
- **Modern Syntax**: Use modern Home Manager / NixOS option structures (e.g., `programs.git.settings.*` rather than legacy deprecated options).

### 2. Flakes & Version Control
- All new and modified files MUST be staged in Git (`git add -A` or specific files) before running any `nix` or `nixos-rebuild` command; otherwise, the Nix Flake evaluator will not see untracked files.
- Always target `nixos-unstable` for package sources.

### 3. Architecture Principles
- **System vs User**: Place system-wide services and hardware configuration in `modules/` or `hosts/`. Place user tools, terminal configs, CLI utilities, and dotfiles in `home/<username>/`.
- **Bootloader**: The repository uses `boot.loader.limine` (with EFI support and generation management). Do not enable `systemd-boot` or `grub` alongside it.
- **Secrets**: Use `sops-nix` with Age/SSH encryption for sensitive data. Store encrypted files in `secrets/` and reference them declaratively.

### 4. Build & Verification Commands
- Test changes without activating:
  ```bash
  nixos-rebuild dry-build --flake .#laptop
  ```
- Apply changes to system:
  ```bash
  sudo nixos-rebuild switch --flake .#laptop
  ```
