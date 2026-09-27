#!/bin/sh
# Restart espanso when a real keyboard device showed up after espanso started.
# Espanso 2.4 with the evdev backend does not pick up hotplugged keyboards,
# so reconnecting a USB/Bluetooth keyboard silently kills all expansions
# until the next manual restart. A user timer runs this every 30s.
#
# Self-trigger safe: the Espanso virtual device is ignored, and after a
# restart espanso is newer than every device, so the check goes quiet again.
# DRY_RUN=1 prints what it sees without restarting.
set -u

STAMP="$HOME/.cache/espanso/last-kbd-restart"
NOW=$(date +%s)
DRY_RUN="${DRY_RUN:-0}"

if [ "$DRY_RUN" -eq 0 ] && [ -f "$STAMP" ]; then
  LAST=$(cat "$STAMP" 2>/dev/null || echo 0)
  case "$LAST" in ''|*[!0-9]*) LAST=0;; esac
  if [ $((NOW - LAST)) -lt 120 ]; then exit 0; fi
fi

START=$(systemctl --user show espanso --property=ExecMainStartTimestamp --value 2>/dev/null)
START_EPOCH=$(date -d "$START" +%s 2>/dev/null) || exit 0

RESTART=0
for f in /dev/input/event*; do
  [ -e "$f" ] || continue
  NAME=$(cat "/sys/class/input/${f##*/}/device/name" 2>/dev/null || echo "")
  case "$NAME" in *Espanso*) continue;; esac
  if udevadm info --query=property --name="$f" 2>/dev/null | grep -q "ID_INPUT_KEYBOARD=1"; then
    MTIME=$(stat -c %Y "$f" 2>/dev/null || echo 0)
    if [ "$DRY_RUN" -eq 1 ]; then
      if [ "$MTIME" -gt "$START_EPOCH" ]; then STATE="NEWER"; else STATE="older"; fi
      echo "$f ($NAME): mtime=$MTIME start=$START_EPOCH -> $STATE"
    fi
    if [ "$MTIME" -gt "$START_EPOCH" ]; then RESTART=1; fi
  fi
done

if [ "$DRY_RUN" -eq 1 ]; then
  echo "restart_needed=$RESTART"
  exit 0
fi

if [ "$RESTART" -eq 1 ]; then
  echo "$NOW" > "$STAMP"
  systemctl --user restart espanso
fi
