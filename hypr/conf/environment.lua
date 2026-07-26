-- Environment Variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XCURSOR_THEME", "catppuccin-mocha-mauve-cursors")
hl.env("HYPRCURSOR_THEME", "catppuccin-mocha-mauve-cursors")

hl.env("XDG_CONFIG_HOME", os.getenv("HOME") .. "/.config")
hl.env("SSH_AUTH_SOCK", os.getenv("XDG_RUNTIME_DIR") .. "/ssh-agent.socket")

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- General Configuration
-- hl.config({
--     general = {
--         gaps_in = 7,
--         gaps_out = 7,
--         border_size = 1,
--         col = {
--             active_border = "rgba(00ff99ee)",
--             inactive_border = "rgba(595959aa)",
--         },
--         resize_on_border = false,
--         allow_tearing = true,
--     },
-- })
--

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
    },

    decoration = {
        rounding = 20,
        rounding_power = 2,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            vibrancy = 0.1696,
        },
    },
})

-- Program definitions
_G.terminal = "alacritty"
_G.fileManager = "thunar"
