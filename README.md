# SorrowVale Desktop

> A dark gothic KDE Plasma environment focused on atmosphere, usability, and system visibility.

SorrowVale Desktop is a custom desktop experience built on top of Fedora KDE Plasma. It combines Plasma customization, a custom Look and Feel package, Conky system monitoring, typography, icons, cursors, and a dual-monitor layout into a cohesive workstation environment.

SorrowVale is **not a Linux distribution**. It is a reproducible configuration layer intended to be installed on top of an existing KDE Plasma system.

## Current Platform

The reference workstation currently uses:

- Fedora 44
- KDE Plasma
- Wayland
- NVIDIA GPU
- Dual-monitor workstation
- Conky 1.22+
- JetBrains Mono
- Papirus Dark
- Bibata Modern Classic

### Reference display layout

| Display | Resolution | Orientation | Role |
| --- | --- | --- | --- |
| DP-1 | 2560x1440 | Landscape | Primary |
| HDMI-A-1 | 1080x1920 | Portrait | Secondary |

The output names above describe the reference workstation only. Other systems may expose different names or Xinerama ordering.

## Features

### SorrowVale Plasma Experience

Custom Plasma Look and Feel package:

`com.sorrowvale.desktop`

It currently includes:

- Custom SorrowVale splash screen
- Dark gothic visual identity
- Crimson accent palette
- Plasma integration
- Custom package metadata
- English and Spanish metadata localization

### Dual Conky HUD

SorrowVale uses two independent Conky instances.

**Primary display:** a detailed system HUD containing workstation information and system telemetry.

**Portrait display:** a minimal HUD designed to preserve the wallpaper composition while displaying essential system information.

On the reference workstation the HUDs are assigned using Xinerama monitor indexes:

```text
-m 0 -> primary landscape display
-m 1 -> portrait display
```

This mapping is not assumed to be identical on other systems. Check `xrandr --listmonitors` before adapting the configuration.

### Automatic startup

Both Conky instances are started automatically after the Plasma session begins. The launcher waits briefly for Plasma and the display layout to initialize before starting the HUDs.

### Visual identity

SorrowVale uses a restrained palette centered around:

- Near-black backgrounds
- Dark gray surfaces
- Off-white primary text
- Muted gray secondary text
- Dark crimson accents

Primary accent: `#A93232`

## Project Structure

```text
SorrowVale/
├── autostart/
│   └── sorrowvale-conky.desktop.template
├── conky/
│   ├── sorrowvale.conf
│   ├── sorrowvale-vertical.conf
│   └── start-sorrowvale.sh
├── docs/
│   ├── CONKY.md
│   ├── INSTALLATION.md
│   ├── KDE-THEME.md
│   ├── MULTI-MONITOR.md
│   └── TROUBLESHOOTING.md
├── plasma/
│   └── look-and-feel/
│       └── com.sorrowvale.desktop/
└── README.md
```

Wallpaper and screenshot assets will be added as the project is prepared for a first release.

## Design Philosophy

SorrowVale is built around three principles:

1. **Atmosphere without distraction**
2. **Useful system information**
3. **Reproducible Linux configuration**

The desktop should feel atmospheric while remaining practical for development, DevOps, system administration, and everyday use.

## Installation

Installation is currently manual. See [`docs/INSTALLATION.md`](docs/INSTALLATION.md).

An automated `install.sh` is planned. The long-term goal is a workflow similar to:

```bash
git clone git@github.com:sorrowvale/Sorrowvale-theme.git
cd Sorrowvale-theme
./install.sh
```

The installer does not exist yet; the command above describes the planned workflow only.

## Documentation

- [`INSTALLATION.md`](docs/INSTALLATION.md) — manual installation and dependencies
- [`KDE-THEME.md`](docs/KDE-THEME.md) — Plasma Look and Feel and splash screen
- [`CONKY.md`](docs/CONKY.md) — HUD architecture and configuration
- [`MULTI-MONITOR.md`](docs/MULTI-MONITOR.md) — dual-monitor behavior
- [`TROUBLESHOOTING.md`](docs/TROUBLESHOOTING.md) — known issues and fixes

## Project Status

SorrowVale Desktop is under active development. The current configuration is tested on the reference Fedora KDE workstation and is gradually being generalized for other KDE Plasma systems.

## Licensing and Upstream Attribution

The SorrowVale Look and Feel package was initially developed from KDE Plasma/Breeze resources. Files that remain derived from upstream KDE components retain their respective copyright and licensing requirements.

A project-wide licensing layout will be finalized before the first public release. Until that review is complete, do not assume that every file in this repository is original SorrowVale work or covered by a single project-wide license.
