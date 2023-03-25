local M = {}

function M.setup()
  local set = vim.opt

  -- ==================== Theme Settings ==================== --

  set.termguicolors = true
  -- vim.cmd("colorscheme grucbox-material")
  vim.cmd("colorscheme everforest")

  -- ================= Indentation Settings ================= --

  set.expandtab = true
  set.tabstop = 4
  set.shiftwidth = 4
  set.autoindent = true
  set.smartindent = true
  set.smarttab = true
  set.shiftround = true
  set.preserveindent = true

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
  vim.cmd('autocmd BufEnter * silent! lcd %:p:h')

  -- Yanking
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

return M
