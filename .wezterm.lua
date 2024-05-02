local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Dracula"
config.font = wezterm.font("GohuFont uni11 Nerd Font Mono")
config.font_size = 16
config.enable_scroll_bar = true
config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "-l" }
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.use_fancy_tab_bar = false

wezterm.on("update-right-status", function(window, pane)
  local left_cells = {}
  local cells = {}

  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    local cwd = ""
    local hostname = ""

    cwd = cwd_uri.file_path
    hostname = cwd_uri.host or wezterm.hostname()

    -- Remove the domain name portion of the hostname
    local dot = hostname:find("[.]")
    if dot then
      hostname = hostname:sub(1, dot - 1)
    end
    if hostname == "" then
      hostname = wezterm.hostname()
    end

    table.insert(left_cells, cwd)
    table.insert(cells, hostname)
  end

  -- I like my date/time in this style: "Wed Mar 3 08:14"
  local date = wezterm.strftime("%a %b %-d %H:%M")
  table.insert(cells, date)

  -- An entry for each battery (typically 0 or 1 battery)
  for _, b in ipairs(wezterm.battery_info()) do
    table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
  end

  -- The filled in variant of the < symbol
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Color palette for the backgrounds of each cell
  local colors = {
    "#3c1361",
    "#52307c",
    "#663a82",
    "#7c5295",
    "#b491c8",
  }

  -- Foreground color for the text across the fade
  local text_fg = "#c0c0c0"

  -- The elements to be formatted
  local elements = {}
  local left_elements = {}
  -- How many cells have been formatted
  local num_cells = 0

  -- Translate a cell into elements
  function push(target, text, is_last)
    local cell_no = num_cells + 1
    table.insert(target, { Foreground = { Color = text_fg } })
    table.insert(target, { Background = { Color = colors[cell_no] } })
    table.insert(target, { Text = " " .. text .. " " })
    if not is_last then
      table.insert(target, { Foreground = { Color = colors[cell_no + 1] } })
      table.insert(target, { Text = SOLID_LEFT_ARROW })
    end
    num_cells = num_cells + 1
  end

  while #cells > 0 do
    local cell = table.remove(cells, 1)
    push(cell, #cells == 0)
  end

  while #left_cells > 0 do
    local cell = table.remove(left_cells, 1)
    push(left_elements, cell, #cells == 0)
  end
  window:set_right_status(wezterm.format(elements))
  window:set_left_status(wezterm.format(left_elements))
end)
config.colors = {
  tab_bar = {
    background = "#1D1E2E",

    -- The active tab is the one that has focus in the window
    active_tab = {
      bg_color = "#313243",
      fg_color = "#C0C8E5",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = "#1E1D2E",
      fg_color = "#808080",
    },

    new_tab = {
      bg_color = "#1D1E2E",
      fg_color = "#1D1E2E",
    },

    new_tab_hover = {
      bg_color = "#1D1E2E",
      fg_color = "#909090",
    },
  },
}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 3000 }
config.debug_key_events = true
config.keys = {
  {
    key = "|",
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "v",
    mods = "LEADER",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "x",
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  {
    key = "q",
    mods = "LEADER",
    action = wezterm.action.PaneSelect({}),
  },
  {
    key = "RightArrow",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "LeftArrow",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "UpArrow",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "DownArrow",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "v",
    mods = "CTRL",
    action = wezterm.action.PasteFrom("Clipboard"),
  },
  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "1",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = "2",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = "3",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = "4",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = "5",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = ">",
    mods = "LEADER|SHIFT",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = "<",
    mods = "LEADER|SHIFT",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = "[",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = "]",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = "%",
    mods = "LEADER|SHIFT",
    action = wezterm.action.CloseCurrentTab({ confirm = true }),
  },
  {
    key = "c",
    mods = "CTRL",
    action = wezterm.action.CopyTo("Clipboard"),
  },
  {
    key = "w",
    mods = "LEADER",
    action = wezterm.action.ShowTabNavigator,
  },
  {
    key = "s",
    mods = "LEADER",
    action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
  },
  {
    key = "p",
    mods = "LEADER",
    action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|COMMANDS" }),
  },
  {
    key = "a",
    mods = "LEADER|CTRL",
    action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
  },
}
return config
