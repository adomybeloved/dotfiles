# AI Agent Guidelines for Dotfiles

This repository contains declarative NixOS and Home Manager configurations using Nix Flakes.

## Project Structure

```text
Dotfiles/
├── flake.nix                       # Flake entrypoint (inputs: nixpkgs-unstable, home-manager, sops-nix, zen-browser, noctalia, qylock)
├── flake.lock                      # Flake lockfile
├── .sops.yaml                      # SOPS encryption keys and path rules
├── AGENTS.md                       # Guidelines for AI assistants
├── hosts/                          # Machine-specific host configurations
│   └── laptop/
│       ├── default.nix             # Host definition (imports hardware-config, core, desktop/*, hardware/*)
│       └── hardware-configuration.nix
├── modules/                        # System-level NixOS modules
│   ├── core/
│   │   ├── default.nix             # Base system aggregator
│   │   ├── nix.nix                 # Nix daemon settings, GC, store optimization
│   │   ├── boot.nix                # Limine bootloader, kernel, ZRAM, sysctl
│   │   ├── security.nix            # Polkit, RTKit, sudo, GNOME Keyring, Polkit-GNOME Agent
│   │   ├── network.nix             # NetworkManager, loose rp_filter, tun kernel module, Wireshark
│   │   ├── sound.nix               # PipeWire, JACK
│   │   ├── locale.nix              # Timezone, locales
│   │   ├── fonts.nix               # System fonts (Iosevka, JetBrainsMono, Inter, Sarasa Gothic, Noto CJK)
│   │   ├── users.nix               # User accounts, wireshark/docker groups, default shell
│   │   ├── packages.nix            # System packages, udisks2, external filesystem drivers
│   │   └── docker.nix              # Docker daemon (Btrfs storage driver), autoPrune
│   ├── desktop/
│   │   ├── niri.nix                # System-level Niri compositor, portals, Noctalia services, Kanagawa icons
│   │   ├── plymouth.nix            # Optional Plymouth boot splash (circle_alt theme, quiet boot)
│   │   ├── gaming.nix              # Steam, 32-bit Mesa, GameMode, gamescope, vm.max_map_count
│   │   └── qylock.nix              # Qylock (Reverse: 1999) SDDM theme and GStreamer video codecs
│   └── hardware/
│       ├── amd.nix                 # AMD P-State, early KMS amdgpu, Mesa graphics
│       ├── laptop.nix              # Touchpad libinput, Kanata CapsLock dual-role key, battery threshold, suspend-then-hibernate
│       └── bluetooth.nix           # Bluetooth service and powerOnBoot
├── home/                           # User-level Home Manager configurations
│   ├── common/                     # Shared configurations for ANY user on ANY machine
│   │   ├── default.nix             # Common user aggregator
│   │   ├── theme/
│   │   │   └── default.nix         # Kanagawa GTK (adw-gtk3-dark), Qt, phinger-cursors-dark, dconf
│   │   ├── shell/
│   │   │   ├── default.nix         # Zsh, completion, history, aliases (nclean, nupdate)
│   │   │   ├── starship.nix        # Starship prompt (Kanagawa capsules)
│   │   │   └── tools.nix           # Modern CLI tools (zoxide, eza, bat, btop Kanagawa, lazygit Kanagawa, yazi)
│   │   ├── terminal/
│   │   │   └── ghostty.nix         # Ghostty terminal emulator (Kanagawa Wave, Iosevka Nerd Font)
│   │   └── programs/
│   │       ├── dev.nix             # Bun, Node, pnpm, Python (uv), Rust, Go, Docker CLI, Termius, Bruno, sshfs
│   │       ├── browsers.nix        # Zen Browser, Firefox (Kanagawa userChrome)
│   │       ├── media.nix           # AyuGram, Vesktop, MPV (uosc), Zathura, Flameshot, udiskie, daily tools
│   │       ├── gaming.nix          # ProtonUp-Qt (Proton-CachyOS & GE), Protontricks, MangoHud, SteamTinkerLaunch
│   │       ├── network.nix         # AmneziaVPN, AmneziaWG, Throne, Sing-box, ByeDPI, Zapret, Wireshark, Trippy
│   │       └── git.nix             # Git base settings, SSH signing, age/sops tools, Delta
│   └── arlecchino/                 # User profile: Aleksandra Mironova
│       ├── default.nix             # Imports home/common + desktop aggregator
│       └── desktop/
│           ├── default.nix         # Desktop aggregator (niri + noctalia)
│           ├── niri.nix            # User-level Niri scrollable tiling (Kanagawa borders), Swayidle, Qylock lockscreen
│           └── noctalia.nix        # Noctalia status bar, app launcher & control center (Kanagawa palette & wallpaper)
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
- **System vs User**: Place system-wide services and hardware configuration in `modules/` or `hosts/`. Place shared user tools, terminal configs, CLI utilities, and dotfiles in `home/common/`. Place user-specific profiles in `home/<username>/`.
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
