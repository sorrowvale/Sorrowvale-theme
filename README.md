# SorrowVale Desktop

> A dark gothic KDE Plasma environment built for Linux, focused on atmosphere,
> usability and system visibility.

SorrowVale Desktop is a custom desktop environment built on top of Fedora KDE
Plasma.

The project combines KDE Plasma customization, custom wallpapers, Conky system
monitoring, terminal theming and a custom Plasma Look and Feel package into a
cohesive workstation experience.

Rather than being a Linux distribution, SorrowVale is designed as a reproducible
configuration layer that can be installed on top of an existing KDE Plasma
system.

---

## Current Platform

The reference system currently uses:

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

The display names are specific to the reference workstation and are not required
to match on other systems.

---

## Features

### SorrowVale Plasma Experience

Custom Plasma Look and Feel package:

`com.sorrowvale.desktop`

Includes:

- Custom SorrowVale splash screen
- Dark gothic visual identity
- Crimson accent palette
- Plasma integration
- Custom metadata
- English and Spanish metadata localization

### Dual Conky HUD

SorrowVale uses two independent Conky instances.

**Primary display**

A detailed system monitoring HUD containing workstation information and system
telemetry.

**Portrait display**

A minimal HUD designed to preserve the wallpaper composition while displaying
essential CPU, GPU and memory information.

The HUDs are assigned using Xinerama monitor indexes:

```text
-m 0 -> primary display
-m 1 -> portrait display
