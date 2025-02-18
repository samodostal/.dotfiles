local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_domain = "local"

config.term = "xterm-256color"
config.color_scheme = "Tokyo Night"
-- config.window_background_opacity = 0.9
config.window_background_opacity = 1.0
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.font_size = 10.0
config.warn_about_missing_glyphs = false

config.font = wezterm.font({
	family = "JetBrains Mono",
})
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", style = "Italic" }),
	},
}
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.enable_tab_bar = false
--
-- -- Keymaps
-- local action = wezterm.action
--
-- config.leader = { key = "u", mods = "CTRL", timeout_milliseconds = 2000 }
--
-- local keys = {
--     { "s", action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
--     { "v", action.SplitVertical({ domain = "CurrentPaneDomain" }) },
--     { "h", action.ActivatePaneDirection("Left") },
--     { "l", action.ActivatePaneDirection("Right") },
--     { "j", action.ActivatePaneDirection("Down") },
--     { "k", action.ActivatePaneDirection("Up") },
--     { "L", action.AdjustPaneSize({ "Right", 25 }) },
--     { "H", action.AdjustPaneSize({ "Left", 25 }) },
--     { "c", action.SpawnTab("CurrentPaneDomain") },
--     { "h", action.ActivateTab(0) },
--     { "m", action.ActivateTab(1) },
--     { "w", action.ActivateTab(2) },
--     { "v", action.ActivateTab(3) },
--     { "z", action.ActivateTab(4) },
--     { "b", action.ShowLauncherArgs({ flags = "FUZZY|DOMAINS" }) }
-- }
--
-- config.keys = {}
--
-- for i, v in ipairs(keys) do
--     table.insert(config.keys, {
--         mods = "LEADER",
--         key = v[1],
-- 	action = v[2]
--     })
-- end
--
-- wezterm.on("update-status", function(window, pane)
--   local domain = pane:get_domain_name()
--   window:set_left_status(wezterm.format({
--     { Text = " [" .. domain .. "] " },
--   }))
-- end)
--
return config
