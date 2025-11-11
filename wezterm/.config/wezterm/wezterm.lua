local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("colorscheme").apply_to_config(config)
require("keymaps").apply_to_config(config)

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

config.default_cursor_style = "SteadyBar"
config.font = wezterm.font("Berkeley Mono")
config.font_size = 17.0
config.hide_tab_bar_if_only_one_tab = false
config.inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 }
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 25
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.98
config.window_decorations = "RESIZE"

wezterm.on("update-right-status", function(window, _)
  window:set_right_status(window:active_workspace() .. " ")
end)

return config
