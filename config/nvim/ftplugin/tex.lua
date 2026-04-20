vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.formatoptions:append({ c = true, r = true, o = true, q = true })

vim.opt_local.linebreak = true

-- MiniPairs.map_buf(0, "i", "$", {
--   action = "closeopen",
--   pair = "$$",
-- })

vim.api.nvim_set_hl(0, "Todo", { link = "Comment" })
