# SorrowVale Conky HUD

SorrowVale uses two independent Conky instances to provide system information
across a dual-monitor KDE Plasma workstation.

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
