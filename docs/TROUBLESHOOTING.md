# Troubleshooting

This document records issues encountered while building and testing SorrowVale Desktop on the reference Fedora KDE Plasma workstation.

## Both Conky HUDs Appear on the Same Monitor

### Symptom

Both the main and portrait HUD render on the same physical display.

### Fix

Check the Xinerama ordering:

```bash
xrandr --listmonitors
```

Then test each head explicitly:

```bash
conky -d -m 0 -c "$HOME/.config/conky/sorrowvale.conf"
conky -d -m 1 -c "$HOME/.config/conky/sorrowvale-vertical.conf"
```

If your ordering differs from the reference workstation, update the `-m` values in `start-sorrowvale.sh`.

## Conky Does Not Start with Plasma

Validate the generated autostart entry if `desktop-file-validate` is installed:

```bash
desktop-file-validate "$HOME/.config/autostart/sorrowvale-conky.desktop"
```

Successful validation normally produces no output.

Inspect the current user-session log:

```bash
journalctl --user -b | grep -Ei 'conky|sorrowvale|autostart'
```

Also verify that the launcher is executable:

```bash
ls -l "$HOME/.config/conky/start-sorrowvale.sh"
```

## Conky Closes When the Terminal Closes

SorrowVale launches Conky in daemon mode with `-d`. For manual testing, use the same mode:

```bash
conky -d -c "$HOME/.config/conky/sorrowvale.conf"
```

## Home Path in Plasma Autostart

The repository does not place `$HOME` directly in the Desktop Entry `Exec=` line. Instead, the template contains:

```text
Exec=@HOME@/.config/conky/start-sorrowvale.sh
```

During manual installation, replace `@HOME@` with the absolute home directory using the command documented in `INSTALLATION.md`.

## Inspect Running Conky Processes

```bash
pgrep -a conky
```

Restart the SorrowVale HUDs:

```bash
pkill conky 2>/dev/null || true
"$HOME/.config/conky/start-sorrowvale.sh"
```

## SorrowVale Does Not Appear in Plasma

Verify the installed package:

```bash
ls "$HOME/.local/share/plasma/look-and-feel/com.sorrowvale.desktop"
```

Refresh KDE's service cache:

```bash
kbuildsycoca6
```

Then reopen System Settings.

## Validate Look and Feel Metadata

```bash
python3 -m json.tool \
    "$HOME/.local/share/plasma/look-and-feel/com.sorrowvale.desktop/metadata.json" \
    >/dev/null && echo "METADATA OK"
```

## Wayland Note

The reference session uses Wayland, while the current Conky monitor placement relies on the X11/Xinerama support exposed by the installed Conky build. This setup works on the reference workstation, but it should not yet be described as universally portable across all Wayland/KDE configurations.
