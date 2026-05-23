-- Environment Variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "catppuccin-macchiato-dark-cursors")
hl.env("XDG_CONFIG_HOME", os.getenv("HOME") .. "/.config")
hl.env("SSH_AUTH_SOCK", os.getenv("XDG_RUNTIME_DIR") .. "/ssh-agent.socket")

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- General Configuration
hl.config({
    general = {
        gaps_in = 7,
        gaps_out = 7,
        border_size = 1,
        col = {
            active_border = "rgba(00ff99ee)",
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = true,
    }
})

-- Program definitions
_G.terminal = "alacritty"
_G.fileManager = "thunar"
