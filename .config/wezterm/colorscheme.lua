local wezterm = require("wezterm")

local module = {}

local theme = os.getenv("HOME") .. "/.theme"

local dark_color_scheme = "Rosé Pine Moon (Gogh)"
local light_color_scheme = "Rosé Pine Dawn (Gogh)"

local function color_scheme_overrides(color_scheme)
  return color_scheme == dark_color_scheme
      and {
        tab_bar = {
          background = "#2a273f",

          active_tab = {
            bg_color = "#2a273f",
            fg_color = "#e0def4",
          },

          inactive_tab = {
            bg_color = "#2a273f",
            fg_color = "#6e6a86",
          },

          inactive_tab_hover = {
            bg_color = "#2a273f",
            fg_color = "#6e6a86",
          },

          new_tab = {
            bg_color = "#2a273f",
            fg_color = "#6e6a86",
          },

          new_tab_hover = {
            bg_color = "#3b3052",
            fg_color = "#909090",
          },
        },
        split = "#44415a",
      }
    or {
      tab_bar = {
        background = "#fffaf3",

        active_tab = {
          bg_color = "#fffaf3",
          fg_color = "#575279",
        },

        inactive_tab = {
          bg_color = "#fffaf3",
          fg_color = "#9893a5",
        },

        inactive_tab_hover = {
          bg_color = "#fffaf3",
          fg_color = "#9893a5",
        },

        new_tab = {
          bg_color = "#fffaf3",
          fg_color = "#9893a5",
        },

        new_tab_hover = {
          bg_color = "#3b3052",
          fg_color = "#909090",
        },
      },
      split = "#dfdad9",
    }
end

local function color_scheme_from_theme()
  local file = io.open(theme, "r")
  local current_theme

  if file then
    current_theme = file:read("*a")
    file:close()
  end

  return current_theme == "light\n" and light_color_scheme or dark_color_scheme
end

function module.apply_to_config(config)
  wezterm.add_to_config_reload_watch_list(theme)
  config.color_scheme = color_scheme_from_theme()
  config.colors = color_scheme_overrides(config.color_scheme)
end

return module
