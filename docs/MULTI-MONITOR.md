# Multi-Monitor Configuration

SorrowVale Desktop was designed on a dual-monitor KDE Plasma workstation.

## Reference Layout

| Xinerama Head | Output | Resolution | Orientation | Role |
| --- | --- | --- | --- | --- |
| 0 | DP-1 | 2560x1440 | Landscape | Primary |
| 1 | HDMI-A-1 | 1080x1920 | Portrait | Secondary |

KDE reported the reference output geometries as:

```text
DP-1:      1080,228 2560x1440
HDMI-A-1:  0,0      1080x1920
```

These output names and positions are specific to the reference workstation.

## Inspect the Layout

KDE Plasma display information:

```bash
kscreen-doctor -o
```

Xinerama monitor ordering:

```bash
xrandr --listmonitors
```

On the reference workstation the relevant ordering is:

```text
0 -> DP-1
1 -> HDMI-A-1
```

## Conky Monitor Assignment

The main HUD is assigned to Xinerama head 0:

```bash
conky -d -m 0 -c "$HOME/.config/conky/sorrowvale.conf"
```

The portrait HUD is assigned to Xinerama head 1:

```bash
conky -d -m 1 -c "$HOME/.config/conky/sorrowvale-vertical.conf"
```

## Why Xinerama Heads Are Used

The reference desktop runs KDE Plasma on Wayland. During development, using only Conky alignment and `gap_x` / `gap_y` did not reliably select different physical monitors; both HUDs could end up on the same display.

The installed Conky build exposes Xinerama monitor selection through:

```text
-m, --xinerama-head=N
```

Explicitly selecting heads 0 and 1 provided reliable placement on the reference system.

## Adapting SorrowVale to Another Workstation

Do not assume that another system uses the same output names or ordering. First run:

```bash
xrandr --listmonitors
```

Then adjust the `-m` values in `conky/start-sorrowvale.sh` if necessary.

The current launcher assumes exactly two relevant heads and does not yet auto-detect which monitor is landscape or portrait. Automatic monitor detection is a possible future improvement.
