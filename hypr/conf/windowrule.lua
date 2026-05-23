-- Window Rules Configuration

-- Flameshot multi-display fix
hl.window_rule({
    name = "flameshot-multi-display-fix",
    match = { class = "flameshot" },
    animation = "fade",
    rounding = 0,
    border_size = 0,
    fullscreen_state = "0 0",
    float = true,
    pin = true,
    monitor = "DP-1",
    move = { 0, 0 },
    size = { "(monitor_w*2)", "(monitor_h)" },
})
