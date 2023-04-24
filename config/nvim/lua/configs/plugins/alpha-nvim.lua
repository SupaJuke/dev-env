local M         = {}
local alpha     = require('alpha')
local startify  = require('alpha.themes.startify')
local dashboard = require('alpha.themes.dashboard')

-- Variables
local soup_pic  = {
  [[╭────────────────────────────────────────────────────────────────────────╮]],
  [[│                                                                        │]],
  [[│                                     ▄                                  │]],
  [[│                                     █▄                                 │]],
  [[│                   ▄▀▀    ▀▀▀▄       █▒█▄                               │]],
  [[│                 ▄▀         ▒ ▀▄▄▄▒▒▒▀░▀▀▀▀▀▒▒▒▄▄▄                      │]],
  [[│                █     ▄▄██▄▄▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▄▄ ▄▀▀     ▀▀▄      │]],
  [[│                ▌    █▓▓▓▀░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀█▄▒        ▀▄    │]],
  [[│                █   ▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▀▄▄        █   │]],
  [[│                ▐▄▒ █▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▓█▄      ▌  │]],
  [[│                  ██░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░█▓█▌     █  │]],
  [[│          ▄       █░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░██▌▒▒▒▒░▌  │]],
  [[│                  ▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█░░░░ █   │]],
  [[│ ▄      ▄▀▀█▄▄▄  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░██▀ ▌▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▌ ▄█▀    │]],
  [[│        █░░░   ▌  ▌▒▒▒▒▒▒▒▒▒▒▒▒▒░█▀▐▀  ▐░██▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█        │]],
  [[│         █▀░░░ ▐  █▒▒▒▒▒▒▒▒▒▒▄▒▀   ▀    ██ ▀  █░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌       │]],
  [[│         ▀▒▀▒▄▀    █▒▒▒▒░▄▒██▄           █     ▀█░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌       │]],
  [[│    ▀               █▒▄▀▀  ▄   ▄          ▀   ▀▀▀▀█▄▒▒▒▒▒▒▒▒▒▒▒▐        │]],
  [[│    ▄                █▌  ▄▄▄   ▐▀▀     ▀█▄█     ▄   ▀██▒▒▒▒▒▒▒▒█    ▄▄▄ │]],
  [[│      ▄▄▄█▀█         ▌ ▌ ▀█▀    ▌        █    ▄▄▄    █ █▄▒▒▒▒▒█  ▄█▒▒▄█ │]],
  [[│      ▀▄▄░░ ▐         ▄       ▄▀         ▌    ███    ▀  ▀▄▀▄░█    █████ │]],
  [[│    ▄  ▐▌▄█▄▀    ▄▀▀  █▀ ▄▄▄▄▀  ▄      ▄ ▀▄         ▄   ▌▌ █   ▄▀▄███▀  │]],
  [[│        ▀ ▄      ▀▀▀   ▄        █▄    ▄█   ▀ ▄ ▄▄▄ ▀      ▄█▄▀▄▀ ▄█▀    │]],
  [[│ ░▄                     ▄         ▄█▀▀▌▒█             ████▓██           │]],
  [[│   ▒▄          ▄▄▀▀▀▀▀▀ ▄▀▄▄        ▀█▄█▀           ▄█▀▀▄▀██▄           │]],
  [[│  ░█    ▄▄    ▌▀▐██▄     ▒▒░░▀▀▀ ▄▄▄▄▄▄        ▄▄▄██▄▄█▄ ░▐█▓█▄▄        │]],
  [[│ ▀▀▀          ▀█▐██            ▒▒▒░       ░░░░▒▒     ▄▄▄▄▐▀█▀█▓█▄       │]],
  [[│        ▄▄      ▀▀▄                                  ▀██▀▄▐▄▀░█████     │]],
  [[│       █   ▀        ▀▀▄▄▄     ▀████▌ ▄██▄███▌          ▄███▓▓███▀▀      │]],
  [[│        ▀ ▀            ▐▀      ▄▄██▄   ▄▄█         ▐▀▀   ▀▀▀▀           │]],
  [[│                      ▄▌       ▀  ▀▀  ▀▀           ▐                    │]],
  [[│                      ▀                             ▌                   │]],
  [[│                                                                        │]],
  [[╰────────────────────────────────────────────────────────────────────────╯]],
}

local quote     = {
  [[╭─────────────────────────────────────────────────────────────────────────────╮]],
  [[│ "To live is to suffer, to survive is to find some meaning in the suffering" │]],
  [[│ ---- Fredrich Neitzsche                                                     │]],
  [[╰─────────────────────────────────────────────────────────────────────────────╯]],
}

function M.setup()
  -- ============================ Startify Settings ============================

  startify.section.header.val = soup_pic
  startify.section.top_buttons.val = {
    startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  }
  startify.section.bottom_buttons.val = {
    startify.button("q", "  Quit NVIM", ":qa<CR>"),
  }
  startify.section.footer = {
    type = "text",
    val = quote,
    opts = {
      hl = "Type",
      shrink_margin = false,
      -- wrap = "overflow";
    },
  }

  -- ============================ Dashboard Settings ===========================

  -- Set header
  dashboard.section.header.val = soup_pic

  -- Set menu
  dashboard.section.buttons.val = {
    dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  > Find file", ":Telescope find_files <CR>"),
    dashboard.button("r", "  > Recent", ":Telescope oldfiles <CR>"),
    dashboard.button("s", "  > Settings",
      ":cd $HOME/.nvimrc | e lua/init.lua | :Telescope find_files <CR>"),
    dashboard.button("z", "  > ZSH Settings", ":e ~/.zshrc | :cd %:p:h | pwd <CR>"),
    dashboard.button("q", "  > Quit NVIM", ":qa <CR>"),
  }

  -- Set footer
  dashboard.section.footer.val = quote

  -- =========================== Send config to alpha ==========================

  alpha.setup(dashboard.opts)
  -- alpha.setup(startify.config)
end

return M
