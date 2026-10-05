# Installation

This document describes the current manual installation process for SorrowVale Desktop.

> SorrowVale is currently developed and tested on Fedora 44 with KDE Plasma running on Wayland.

## Requirements

The reference environment uses:

- Fedora 44
- KDE Plasma
- Wayland
- Conky 1.22+
- JetBrains Mono
- Papirus Dark
- Bibata Modern Classic
- NVIDIA utilities for the current GPU telemetry

Some components may work on other KDE Plasma distributions, but they have not yet been validated.

## Repository Components

The current repository contains:

```text
conky/
autostart/
plasma/look-and-feel/
docs/
```

Wallpaper and screenshot assets are planned but are not yet part of the repository.

## Install Conky Files

Create the configuration directory:

```bash
mkdir -p "$HOME/.config/conky"
```

Copy the HUD configurations and launcher:

```bash
cp conky/sorrowvale.conf "$HOME/.config/conky/"
cp conky/sorrowvale-vertical.conf "$HOME/.config/conky/"
cp conky/start-sorrowvale.sh "$HOME/.config/conky/"
chmod +x "$HOME/.config/conky/start-sorrowvale.sh"
```

## Install Plasma Autostart

Create the autostart directory:

```bash
mkdir -p "$HOME/.config/autostart"
```

Generate the Desktop Entry from the repository template:

```bash
sed "s|@HOME@|$HOME|g" \
    autostart/sorrowvale-conky.desktop.template \
    > "$HOME/.config/autostart/sorrowvale-conky.desktop"
```

If `desktop-file-validate` is available, validate the generated entry:

```bash
desktop-file-validate "$HOME/.config/autostart/sorrowvale-conky.desktop"
```

A successful validation normally produces no output.

## Install the Plasma Look and Feel Package

Create the local package directory:

```bash
mkdir -p "$HOME/.local/share/plasma/look-and-feel"
```

Copy SorrowVale:

```bash
cp -a plasma/look-and-feel/com.sorrowvale.desktop \
    "$HOME/.local/share/plasma/look-and-feel/"
```

Refresh KDE's service cache:

```bash
kbuildsycoca6
```

The SorrowVale package should then appear in the relevant KDE Plasma appearance settings.

## Test the HUDs

Before relying on autostart, check your monitor ordering:

```bash
xrandr --listmonitors
```

The repository launcher currently assumes the reference ordering:

```text
0 -> landscape/main HUD
1 -> portrait HUD
```

Then test:

```bash
pkill conky 2>/dev/null || true
"$HOME/.config/conky/start-sorrowvale.sh"
```

Inspect the processes:

```bash
pgrep -a conky
```

If both HUDs appear on the same display or on the wrong displays, see [`MULTI-MONITOR.md`](MULTI-MONITOR.md) and [`TROUBLESHOOTING.md`](TROUBLESHOOTING.md).

## Restart the Plasma Session

Log out and log back in to verify that the autostart entry launches both HUDs correctly.

## What Is Not Automated Yet

The current repository does not yet automatically configure every part of the reference desktop. In particular, monitor layout, wallpaper assignment, SDDM configuration, lock-screen artwork, icon/cursor selection, and some appearance settings remain manual.

## Planned Installer

An `install.sh` installer is planned. Until it exists, follow this manual procedure rather than assuming that `./install.sh` is available.
