# SorrowVale Conky HUD

SorrowVale uses two independent Conky instances to provide system information across a dual-monitor KDE Plasma workstation.

## Architecture

```text
Plasma session
      |
      v
Autostart
      |
      v
start-sorrowvale.sh
      |
      +----> Conky Main       (-m 0)
      |
      +----> Conky Portrait   (-m 1)
```

The launcher waits briefly before starting Conky so Plasma, KWin, and the display layout have time to initialize.

## Configurations

### Main HUD

Installed file:

```text
~/.config/conky/sorrowvale.conf
```

Designed for the primary 2560x1440 landscape display on the reference workstation.

### Portrait HUD

Installed file:

```text
~/.config/conky/sorrowvale-vertical.conf
```

Designed for the secondary 1080x1920 portrait display. It intentionally contains less information to preserve the wallpaper composition.

## Multi-monitor selection

The reference workstation runs Plasma on Wayland. Its Conky build includes X11/Xinerama support and exposes:

```text
-m, --xinerama-head=N
```

The reference Xinerama ordering is:

```text
0 -> DP-1       2560x1440 landscape
1 -> HDMI-A-1   1080x1920 portrait
```

SorrowVale therefore starts the HUDs with:

```bash
conky -d -m 0 -c "$HOME/.config/conky/sorrowvale.conf"
conky -d -m 1 -c "$HOME/.config/conky/sorrowvale-vertical.conf"
```

Using only alignment plus `gap_x` and `gap_y` was not sufficient for reliable physical-monitor selection on the reference Plasma Wayland environment. Explicit Xinerama head selection solved that placement issue.

Monitor ordering can differ on other systems. Always verify it with:

```bash
xrandr --listmonitors
```

## Startup

The launcher is installed at:

```text
~/.config/conky/start-sorrowvale.sh
```

The repository script uses `$HOME` rather than a hard-coded username.

The Plasma autostart entry is generated from:

```text
autostart/sorrowvale-conky.desktop.template
```

The template contains `@HOME@`, which should be replaced with the user's absolute home directory during installation. This avoids depending on shell variable expansion directly inside the Desktop Entry `Exec=` field.

## Dependencies

The current HUD expects:

- Conky
- JetBrains Mono
- system interfaces exposed by Linux for CPU and memory telemetry
- NVIDIA utilities for the NVIDIA-specific GPU telemetry currently used by the configuration

The current reference configuration is NVIDIA-oriented. Support for other GPU telemetry backends has not yet been implemented.

## Testing

Start each HUD manually:

```bash
conky -d -m 0 -c "$HOME/.config/conky/sorrowvale.conf"
conky -d -m 1 -c "$HOME/.config/conky/sorrowvale-vertical.conf"
```

Inspect running instances:

```bash
pgrep -a conky
```

Restart both through the SorrowVale launcher:

```bash
pkill conky 2>/dev/null || true
"$HOME/.config/conky/start-sorrowvale.sh"
```

See [`TROUBLESHOOTING.md`](TROUBLESHOOTING.md) for known startup and monitor-placement issues.
