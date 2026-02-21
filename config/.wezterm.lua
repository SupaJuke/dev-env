-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.max_fps = 120

-- or, changing the font size and color scheme.
config.font = wezterm.font({ family = "Maple Mono NF" })
config.font_size = 14
config.font_rules = {
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font({ family = "Maple Mono NF", weight = "Bold" })
  },
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font({ family = "Maple Mono NF", weight = "Bold", italic = true })
  },
  {
    intensity = "Half",
    italic = false,
    font = wezterm.font({ family = "Maple Mono NF", weight = "Medium" })
  },
  {
    intensity = "Half",
    italic = true,
    font = wezterm.font({ family = "Maple Mono NF", weight = "Medium", italic = true })
  },
}
config.bold_brightens_ansi_colors = "BrightAndBold"

config.color_scheme = 'Kanagawa (Gogh)'
-- config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Everforest Dark Hard (Gogh)'

config.wsl_domains = {
  {
    -- The name of this specific domain.  Must be unique amonst all types
    -- of domain in the configuration file.
    name = 'WSL:Ubuntu',

    -- The name of the distribution.  This identifies the WSL distribution.
    -- It must match a valid distribution from your `wsl -l -v` output in
    -- order for the domain to be useful.
    distribution = 'Ubuntu-24.04',

    -- set default directory
    -- default_cwd = "\\\\wsl.localhost\\Ubuntu-24.04\\home\\supa"
    default_cwd = os.getenv("HOME") or "/home/supa"
  },
}

-- Positioning and Size for initial screen
wezterm.on("gui-startup", function(cmd)
  local screen            = wezterm.gui.screens().active
  local ratio             = 0.8
  local width, height     = screen.width * ratio, screen.height * ratio
  local tab, pane, window = wezterm.mux.spawn_window {
    position = {
      x = (screen.width - width) / 2,
      y = (screen.height - height) / 2,
      origin = 'ActiveScreen' }
  }
  -- window:gui_window():maximize()
  window:gui_window():set_inner_size(width, height)
end)

-- set default domain to WSL
config.default_domain = 'WSL:Ubuntu'

-- Finally, return the configuration to wezterm:
return config
