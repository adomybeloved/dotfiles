# dotfiles

> Declarative NixOS and Home Manager configuration using Nix Flakes.

![NixOS](https://img.shields.io/badge/NixOS-unstable-5277C3?style=flat-square&logo=nixos&logoColor=white)
![Compositor](https://img.shields.io/badge/compositor-niri-957FB8?style=flat-square)
![Palette](https://img.shields.io/badge/palette-kanagawa_wave-7E9CD8?style=flat-square)
![Lockscreen](https://img.shields.io/badge/lockscreen-reverse:1999-E6C384?style=flat-square)

---

## Overview

Personal workstation configuration for daily driving and development on bare-metal hardware (Honor MagicBook 14, AMD Ryzen). Built around the Niri scrollable tiling compositor, Noctalia shell, and the Kanagawa Wave color palette.

Developed collaboratively with AI agents, tested and verified directly on physical hardware, strictly adhering to modern NixOS modular architecture conventions.

---

## Stack

| Core | Environment |
| :--- | :--- |
| **OS** `NixOS (unstable)` | **Compositor** `Niri (Wayland)` |
| **Terminal** `Ghostty` | **Shell** `Zsh + Starship` |
| **File Manager** `Yazi` | **Browser** `Zen Browser` |
| **Theme** `Kanagawa Wave` | **Lockscreen** `Qylock (Reverse: 1999)` |

---

## Keybindings

<details>
<summary><b>Applications</b></summary>

| Keybind | Command |
| :--- | :--- |
| `Mod + Return` / `Mod + T` | Open Ghostty |
| `Mod + B` | Open Zen Browser |
| `Mod + E` | Open Yazi |
| `Mod + Space` / `Mod + D` | Open launcher |
| `Mod + N` | Open control center |
| `Mod + Comma` | Open settings |
| `Mod + Escape` / `Mod + Shift + L` | Lock screen (Qylock) |
| `Print` / `Mod + Shift + S` | Interactive screenshot (Flameshot) |
| `Mod + Q` | Close window |
| `Mod + Shift + E` | Quit session |

</details>

<details>
<summary><b>Window Management</b></summary>

| Keybind | Action |
| :--- | :--- |
| `Mod + H / J / K / L` | Focus navigation (left / down / up / right) |
| `Mod + Ctrl + H / J / K / L` | Move column / window |
| `Mod + R` | Cycle column width (33% / 50% / 66% / 100%) |
| `Mod + F` | Maximize column |
| `Mod + Shift + F` | Fullscreen window |
| `Mod + C` | Center active column |
| `Mod + 1..9` | Switch workspace |
| `Mod + Shift + 1..9` | Move to workspace |

</details>

---

## Structure

The configuration follows a strict separation of concerns for multi-host and multi-user scalability:

- **`hosts/`** — Hardware definitions and machine-specific entrypoints (laptop power profiles, GPU drivers).
- **`modules/`** — System-level NixOS services, kernel tuning, display managers, and daemons.
- **`home/common/`** — Shared user modules imported across all machines (Kanagawa theme tokens, Zsh, Ghostty, dev toolchain).
- **`home/<user>/`** — Isolated user profiles containing personal packages and desktop keybindings.
