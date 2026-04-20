local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.max_fps = 120

-- ==================================== Fonts ==================================== --

-- or, changing the font size and color scheme.
config.font = wezterm.font({ family = "Maple Mono NF" })
config.font_size = 16
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

-- ================================= Colorschemes ================================ --

config.color_schemes = {
  ["gruvbox_material_dark_hard"] = {
    foreground = "#D4BE98",
    background = "#1D2021",
    cursor_bg = "#D4BE98",
    cursor_border = "#D4BE98",
    cursor_fg = "#1D2021",
    selection_bg = "#D4BE98",
    selection_fg = "#3C3836",

    ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
    -- Change the first one to change ghost texts
    brights = { "#83786f", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
  },
  ["gruvbox_material_dark_medium"] = {
    foreground = "#D4BE98",
    background = "#282828",
    cursor_bg = "#D4BE98",
    cursor_border = "#D4BE98",
    cursor_fg = "#282828",
    selection_bg = "#D4BE98",
    selection_fg = "#45403d",

    ansi = { "#282828", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
    brights = { "#83786f", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
  },
}

-- config.color_scheme = 'Kanagawa (Gogh)'
-- config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Everforest Dark (Gogh)'
config.color_scheme = "gruvbox_material_dark_hard"

-- ================================= Key Mapping ================================= --

config.keys = {
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitVertical
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitHorizontal
  },
}

-- ===================================== WSL ===================================== --

config.wsl_domains = {
  {
    name = 'WSL:Ubuntu',
    distribution = 'Ubuntu-24.04',
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

local function is_wsl()
  -- Check env first
  if os.getenv("WSL_DISTRO_NAME") or os.getenv("WSL_INTEROP") then
    return true
  end

  -- Fallback to /proc/version
  local f = io.open("/proc/version", "r")
  if not f then return false end

  local content = f:read("*a")
  f:close()

  return content:lower():find("microsoft") ~= nil
end

-- set default domain to WSL
if is_wsl() then config.default_domain = 'WSL:Ubuntu' else config.default_domain = "local" end

-- =============================================================================== --

return config
