-- Game Mode
function activate_gamemode()
    hl.config({
        animations = { enabled = false },
        decoration = {
            shadow = { enabled = false },
            blur = { enabled = false },
            active_opacity = 1.0,
            inactive_opacity = 1.0,
            fullscreen_opacity = 1.0,
            rounding = 0
        },
        general = {
            gaps_in = 0,
            gaps_out = 0,
            border_size = 1
        }
    })
    print("Gamemode ON")
end

-- Load Variant
function load_variant(variant_file, variant_name)
    variant_file = variant_file:gsub(".lua", "")
    require("conf." .. variant_name .. "." .. variant_file)
end

zoom = {
    value = 1.0,
    step = 1,
    min = 1.0,
    max = 5.0,
    dirty = true,
    last_apply = 0
}

function zoom.apply()
    hl.config({
        cursor = {
            zoom_factor = zoom.value
        }
    })
end

function zoom.increase()
    zoom.value = math.min(zoom.value + zoom.step, zoom.max)
    zoom.apply()
end

function zoom.decrease()
    zoom.value = math.max(zoom.value - zoom.step, zoom.min)
    zoom.apply()
end
