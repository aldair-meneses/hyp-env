#!/bin/bash
# Capture the focused output with flameshot, skipping the v15 monitor selector.
num=$(swaymsg -t get_outputs | python3 -c "
import json, sys
outs = sorted(json.load(sys.stdin), key=lambda o: (o['rect']['x'], o['rect']['y']))
names = [o['name'] for o in outs]
focused = next(o for o in outs if o['focused'])
print(names.index(focused['name']))
")
exec flameshot screen -n "$num" --edit
