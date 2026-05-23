-- Input Configuration
hl.config({
    input = {
        kb_layout = "br",
        kb_variant = "",
        kb_model = "abnt",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
    cursor = {
        no_hardware_cursors = true,
    },
})

-- Per-device input config
hl.config({
    device = {
        {
            name = "epic-mouse-v1",
            sensitivity = -0.5,
        }
    }
})

-- Gesture configuration
hl.config({
    gesture = {
        { fingers = 3, direction = "horizontal", command = "workspace", params = {} }
    }
})
