#!/usr/bin/env bash

sleep 5

pkill conky 2>/dev/null || true

/usr/bin/conky -d -m 0 -c "$HOME/.config/conky/sorrowvale.conf"
/usr/bin/conky -d -m 1 -c "$HOME/.config/conky/sorrowvale-vertical.conf"
