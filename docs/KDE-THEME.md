# KDE Plasma Theme

SorrowVale includes a custom KDE Plasma Look and Feel package focused on a minimal dark gothic visual identity.

## Package

Package identifier:

```text
com.sorrowvale.desktop
```

Repository location:

```text
plasma/look-and-feel/com.sorrowvale.desktop/
```

Installed location:

```text
~/.local/share/plasma/look-and-feel/com.sorrowvale.desktop/
```

## Reference Environment

The theme is currently tested with:

- Fedora 44
- KDE Plasma
- Wayland
- Papirus Dark icons
- Bibata Modern Classic cursor
- JetBrains Mono

These external components are part of the reference appearance but are not bundled in this repository.

## Visual Language

SorrowVale combines:

- Near-black backgrounds
- Dark gray surfaces
- Off-white primary text
- Muted gray secondary text
- Dark crimson accents

The reference accent used throughout the project is:

```text
#A93232
```

## Splash Screen

The custom Plasma splash is implemented in:

```text
contents/splash/Splash.qml
```

It provides the SorrowVale startup identity while keeping the composition intentionally minimal.

## Metadata

Package metadata is stored in:

```text
metadata.json
```

English is the base metadata language and Spanish localization is also provided.

To validate the JSON syntax:

```bash
python3 -m json.tool \
    plasma/look-and-feel/com.sorrowvale.desktop/metadata.json \
    >/dev/null && echo "METADATA OK"
```

After installation, refresh KDE's cache with:

```bash
kbuildsycoca6
```

## SDDM and Lock Screen

The reference workstation also uses SorrowVale artwork for the login/lock experience, but those machine-level settings are not currently reproduced by this repository installer. They should therefore be treated as manual parts of the reference setup rather than features already automated by this package.

## Upstream KDE Components

The initial SorrowVale Look and Feel package was developed from KDE Plasma/Breeze resources. Several files in the package remain derived from upstream KDE components.

Do not remove upstream copyright or license notices from derived files. A complete licensing/attribution review should be performed before the first formal release so that original SorrowVale assets and inherited KDE resources are clearly distinguished.
