local M = {}

function M.setup()
  local set = vim.opt
  local autocmd = vim.api.nvim_create_autocmd

  -- ==================== Theme Settings ==================== --

  set.termguicolors = true
  -- vim.cmd("colorscheme gruvbox-material")
  vim.cmd("colorscheme everforest")
  -- vim.cmd("colorscheme moonlight") -- contrast too high
  -- vim.cmd("colorscheme material") -- contrast too high
  -- vim.cmd("colorscheme tokyonight")

  -- ================= Indentation Settings ================= --

  set.expandtab = true
  set.tabstop = 4
  set.shiftwidth = 4
  set.autoindent = true
  set.smartindent = true
  set.smarttab = true
  set.shiftround = true
  set.preserveindent = true

  -- Displaying whitespace
  set.list = true
  set.listchars:append "lead:·"
  set.listchars:append "trail:·"

  -- =================== Cursor Settings ==================== --

  set.guicursor = "n-v:block," ..
      "i-c-ci-ve:ver25," ..
      "r-cr:hor20," ..
      "o:hor50," ..
      "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor," ..
      "sm:block-blinkwait175-blinkoff150-blinkon175"

  -- Return cursor once leave -> only for windows
  -- vim.cmd("au VimLeave * set guicursor=a:ver25-blinkon175")

  -- ==================== Other Settings ==================== --

  -- Enable syntax highlighting
  set.syntax = 'enable'

  -- If text goes beyond terminal
  set.wrap = true

  -- Show something (?)
  set.showmode = true
  set.showcmd = true

  -- Line number & Ruler
  set.number = true
  set.ruler = true

  -- Matching bracket
  set.showmatch = true

  -- Maintain terminal (instead of terminating)
  set.hidden = true

  -- Split right
  set.splitright = true

  -- Backspace
  set.backspace = { 'indent', 'eol', 'start' }

  -- Mouse movement
  set.mouse = 'a'

  -- Case insensitive search
  set.ignorecase = true
  set.smartcase = true

  -- Highlight current line
  set.cursorline = true

  -- Change PWD
  -- vim.cmd('autocmd BufEnter * silent! lcd %:p:h')
  -- autocmd("BufEnter", {
  --   pattern = "*",
  --   command = "silent! lcd %:p:h'"
  -- })

  -- Start Neovim with Alpha and NvimTree
  local function start_nvim(data)
    -- Buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- Change to the directory
    vim.cmd.cd(data.file)

    -- Open the tree
    vim.cmd("Alpha")
    vim.cmd("NeoTreeShow")
  end
  autocmd({ "VimEnter" }, { callback = start_nvim })

  -- Yanking (WSL only)
  if vim.g.os == "wsl" then
    vim.g.clipboard = {
      name = 'WslClipboard',
      copy = {
        ["+"] = 'clip.exe',
        ["*"] = 'clip.exe',
      },
      paste = {
        ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      },
      cache_enabled = 0,
    }
  end
end

return M
