-- Workspace configuration
local assignments = {
    ["HDMI-A-1"] = {1, 2, 3, 4},
    ["eDP-1"]    = {5, 6, 7, 8},
}

for monitor, workspaces in pairs(assignments) do
    for idx, ws in ipairs(workspaces) do
        hl.workspace_rule({
            workspace = tostring(ws),
            monitor = monitor,
            default = (idx == 1),
        })
    end
end
