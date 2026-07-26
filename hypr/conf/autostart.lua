hl.on("hyprland.start", function()
    -- D-Bus environment
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- SSH agent
    hl.exec_cmd("systemctl --user import-environment SSH_AUTH_SOCK")
    hl.exec_cmd("systemctl --user enable --now ssh-agent.service")

    -- Noctalia shell
    --hl.exec_cmd("qs -c noctalia-shell")

    -- Noctalia V5
    hl.exec_cmd("noctalia")
    -- FortiClient
    hl.exec_cmd("sleep 5 && /opt/forticlient/fortitraylauncher")

    -- Flameshot
    hl.exec_cmd("flameshot")

    -- Notification daemon
    hl.exec_cmd("exec mako &")

    -- Wallpaper
    hl.exec_cmd("hyprpaper &")

    -- Network manager applet
    hl.exec_cmd("nm-applet &")
end)
