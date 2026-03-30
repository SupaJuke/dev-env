local function TexFocusVim()
  -- Replace 'TERMINAL' with your terminal app name
  -- Example: vim.fn.system("open -a iTerm")
  -- Example: vim.fn.system("open -a Alacritty")
  vim.fn.system("open -a Ghostty")
  vim.cmd("redraw!")
end

local vimtex_group = vim.api.nvim_create_augroup("vimtex_event_focus", { clear = true })

vim.api.nvim_create_autocmd("User", {
  group = vimtex_group,
  pattern = "VimtexEventViewReverse",
  callback = function()
    TexFocusVim()
  end,
})

local M = {}

function M.setup()
  -- MacOS specific
  vim.g.vimtex_view_method = "skim"
end

return M
