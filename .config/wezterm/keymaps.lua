local wezterm = require("wezterm")

local module = {}

local function navigate(key)
  local keys_map = { h = "Left", j = "Down", k = "Up", l = "Right" }

  return {
    key = key,
    mods = "CTRL",
    action = wezterm.action_callback(function(window, pane)
      local process_info = pane:get_foreground_process_info()
      local process_name = process_info and process_info.name
      local is_nvim = process_name == "nvim"

      if is_nvim then
        window:perform_action({ SendKey = { key = key, mods = "CTRL" } }, pane)
      else
        window:perform_action({ ActivatePaneDirection = keys_map[key] }, pane)
      end
    end),
  }
end

function module.apply_to_config(config)
  config.keys = {
    -- Send "CTRL-B" to the terminal when pressing CTRL-B, CTRL-B
    { key = "b", mods = "LEADER|CTRL", action = wezterm.action.SendKey({ key = "b", mods = "CTRL" }) },

    -- Open new vertical/horizontal pane
    { key = "h", mods = "LEADER", action = wezterm.action.SplitVertical({}) },
    { key = "v", mods = "LEADER", action = wezterm.action.SplitHorizontal({}) },

    -- Move between panes
    navigate("h"),
    navigate("j"),
    navigate("k"),
    navigate("l"),

    -- Open new tab
    {
      key = "c",
      mods = "LEADER",
      action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },

    -- Rename current tab
    {
      key = ",",
      mods = "LEADER",
      action = wezterm.action.PromptInputLine({
        description = wezterm.format({
          { Text = "Enter new name for tab" },
        }),
        action = wezterm.action_callback(function(window, _, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      }),
    },

    -- Move current tab to left/right
    { key = "LeftArrow", mods = "LEADER", action = wezterm.action.MoveTabRelative(-1) },
    { key = "RightArrow", mods = "LEADER", action = wezterm.action.MoveTabRelative(1) },

    -- Move pane to new tab
    {
      key = "b",
      mods = "LEADER",
      action = wezterm.action_callback(function(_, pane)
        pane:move_to_new_tab()
      end),
    },

    -- Zoom current pane
    {
      key = "z",
      mods = "LEADER",
      action = wezterm.action.TogglePaneZoomState,
    },

    -- Show workspace selector
    {
      key = "s",
      mods = "LEADER",
      action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES|LAUNCH_MENU_ITEMS" }),
    },

    -- Rename current workspace
    {
      key = "r",
      mods = "LEADER",
      action = wezterm.action.PromptInputLine({
        description = wezterm.format({
          { Text = "Enter new name for workspace" },
        }),
        action = wezterm.action_callback(function(_, _, line)
          if line then
            wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
          end
        end),
      }),
    },

    -- Create new workspace
    {
      key = "w",
      mods = "LEADER",
      action = wezterm.action.PromptInputLine({
        description = wezterm.format({
          { Text = "Enter name for new workspace" },
        }),
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:perform_action(
              wezterm.action.SwitchToWorkspace({
                name = line,
              }),
              pane
            )
          end
        end),
      }),
    },

    -- Clear scroll back and viewport
    {
      key = "K",
      mods = "CTRL|SHIFT",
      action = wezterm.action.Multiple({
        wezterm.action.ClearScrollback("ScrollbackAndViewport"),
        wezterm.action.SendKey({ key = "L", mods = "CTRL" }),
      }),
    },
  }

  for i = 1, 8 do
    -- Switch to tab using LEADER + number
    table.insert(config.keys, {
      key = tostring(i),
      mods = "LEADER",
      action = wezterm.action.ActivateTab(i - 1),
    })
  end
end

return module
