#!/bin/sh
# Uso:
#   bring-to-current.sh [--app-id ID] [--class CLASS] [--title REGEX] -- <comando...>
# Exemplos:
#   bring-to-current.sh --app-id org.keepassxc.KeePassXC --class KeePassXC -- keepassxc
#   bring-to-current.sh --app-id firefox -- firefox
#   bring-to-current.sh --class Spotify -- spotify-launcher

APP_ID=""
CLASS=""
TITLE=""

while [ $# -gt 0 ]; do
    case "$1" in
        --app-id) APP_ID="$2"; shift 2 ;;
        --class) CLASS="$2"; shift 2 ;;
        --title) TITLE="$2"; shift 2 ;;
        --) shift; break ;;
        *) break ;;
    esac
done

if [ $# -eq 0 ] || { [ -z "$APP_ID" ] && [ -z "$CLASS" ] && [ -z "$TITLE" ]; }; then
    echo "uso: bring-to-current.sh [--app-id ID] [--class CLASS] [--title REGEX] -- <comando...>" >&2
    exit 1
fi

FILTERS=""
[ -n "$APP_ID" ] && FILTERS="$FILTERS or .app_id == \"$APP_ID\""
[ -n "$CLASS" ] && FILTERS="$FILTERS or .window_properties.class == \"$CLASS\""
[ -n "$TITLE" ] && FILTERS="$FILTERS or (.name // \"\" | test(\"$TITLE\"))"
FILTERS="${FILTERS# or }"

if swaymsg -t get_tree | jq -e ".. | objects | select($FILTERS)" > /dev/null; then
    CMDS=""
    [ -n "$APP_ID" ] && CMDS="$CMDS; [app_id=\"$APP_ID\"] move window to workspace current, focus"
    [ -n "$CLASS" ] && CMDS="$CMDS; [class=\"$CLASS\"] move window to workspace current, focus"
    [ -n "$TITLE" ] && CMDS="$CMDS; [title=\"$TITLE\"] move window to workspace current, focus"
    swaymsg "${CMDS#; }"
else
    swaymsg "exec $*"
fi
