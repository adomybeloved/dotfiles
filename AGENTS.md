# AI Agent Guidelines for Dotfiles

This repository contains declarative NixOS and Home Manager configurations using Nix Flakes.

## Project Structure

```text
Dotfiles/
├── flake.nix                       # Flake entrypoint (inputs: nixpkgs-unstable, home-manager, sops-nix, zen-browser, catppuccin, noctalia)
├── flake.lock                      # Flake lockfile
├── .sops.yaml                      # SOPS encryption keys and path rules
├── AGENTS.md                       # Guidelines for AI assistants
├── hosts/                          # Machine-specific host configurations
│   └── laptop/
│       ├── default.nix             # Host definition (imports hardware, core, desktop/niri)
│       └── hardware-configuration.nix
├── modules/                        # System-level NixOS modules
│   ├── core/
│   │   ├── default.nix             # Base system aggregator
│   │   ├── nix.nix                 # Nix daemon settings, GC, store optimization
│   │   ├── boot.nix                # Limine bootloader, kernel, ZRAM, sysctl
│   │   ├── security.nix            # Polkit, RTKit, sudo
│   │   ├── network.nix             # NetworkManager
│   │   ├── sound.nix               # PipeWire, JACK
│   │   ├── locale.nix              # Timezone, locales
│   │   ├── fonts.nix               # System fonts (Iosevka, JetBrainsMono, Inter, fontconfig)
│   │   ├── users.nix               # User accounts and default login shell
│   │   └── packages.nix            # System packages
│   └── desktop/
│       └── niri.nix                # System-level Niri compositor, SDDM, portals, Noctalia services
├── home/                           # User-level Home Manager configurations
│   └── arlecchino/
│       ├── default.nix             # Main user config aggregator (Catppuccin Mocha theme)
│       ├── desktop/
│       │   └── niri.nix            # User-level Niri scrollable tiling configuration, Noctalia shell
│       ├── shell/
│       │   ├── default.nix         # Zsh, completion, history, aliases
│       │   ├── starship.nix        # Starship prompt configuration
│       │   └── tools.nix           # Modern CLI tools (zoxide, eza, bat, fzf, direnv, btop, fastfetch, lazygit)
│       ├── terminal/
│       │   └── ghostty.nix         # Ghostty terminal emulator (Iosevka Nerd Font, Catppuccin)
│       └── programs/
│           ├── git.nix             # Git, SSH, GitHub CLI, age/sops tools
│           ├── browsers.nix        # Firefox, Zen Browser (default browser)
│           └── media.nix           # AyuGram, Vesktop, MPV (GPU-next + uosc), Flameshot, comma, daily tools
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
