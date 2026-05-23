-- Keybinding Configuration
local mainMod = "SUPER"
local ipc = "qs -c noctalia-shell ipc call"

-- Launcher and shell commands
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(ipc .. " launcher toggle"), { description = "Launcher toggle" })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd(ipc .. " launcher clipboard"), { description = "Launcher clipboard" })
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(ipc .. " controlCenter toggle"), { description = "Control center toggle" })
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(ipc .. " settings toggle"), { description = "Settings toggle" })

-- Utility binds - Zoom
hl.bind(
    "ALT + SUPER + mouse:272",
    hl.dsp.exec_cmd([[hyprctl eval 'hl.config({ cursor = { zoom_factor = 2 } })']]),
    {
        mouse = true,
        description = "Zoom 2x",
    }
)

hl.bind(
    "ALT + SUPER + mouse:274",
    hl.dsp.exec_cmd([[hyprctl eval 'hl.config({ cursor = { zoom_factor = 1 } })']]),
    {
        mouse = true,
        description = "Reset zoom",
    }
)

hl.bind(
    "SHIFT + SUPER + mouse_down",
    function() zoom.increase() end,
    { mouse = true }
)

hl.bind(
    "SHIFT + SUPER + mouse_up",
    function() zoom.decrease() end,
    { mouse = true }
)

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume increase"), { description = "Volume up", repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume decrease"), { description = "Volume down", repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume muteOutput"), { description = "Mute volume", locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness increase"), { description = "Brightness up", repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness decrease"), { description = "Brightness down", repeating = true })

-- Window management
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(_G.terminal), { description = "Terminal" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Kill active" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(_G.fileManager), { description = "File manager" })
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle float" })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(ipc .. " lockScreen lock"), { description = "Lock screen" })
hl.bind(mainMod .. " + semicolon", hl.dsp.exec_cmd(ipc .. " launcher clipboard"), { description = "Clipboard" })

-- Mouse binds for window manipulation
hl.bind(
    "SUPER + mouse:272",
    hl.dsp.window.drag(),
    {
        mouse = true,
        description = "Move window"
    }
)

hl.bind(
    "SUPER + mouse:273",
    hl.dsp.window.resize(),
    {
        mouse = true,
        description = "Resize window"
    }
)

-- Screenshots
hl.bind("PRINT",
    hl.dsp.exec_cmd("flameshot gui"),
    { description = "Screenshot selection" }
)

hl.bind(mainMod .. " + SHIFT + PRINT",
    hl.dsp.exec_cmd("flameshot launcher"),
    { description = "Screenshot launcher" }
)

-- Focus movement
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { description = "Focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { description = "Focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { description = "Focus down" })

-- Workspace switcher
for i = 1, 8 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }), { description = "Workspace " .. i })
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }), { description = "Move to workspace " .. i })
end
