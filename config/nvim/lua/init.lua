-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configs
local is_wsl = (function()
  local output = vim.fn.systemlist("uname -r")
  return not not string.find(output[1] or "", "WSL")
end)()

local is_mac = vim.fn.has("macunix") == 1

vim.g.os = (function()
  if is_wsl then
    return "wsl"
  elseif is_mac then
    return "macos"
  else
    return "linux"
  end
end)()

require("lazy").setup("plugins")
require("configs.configs").setup()
