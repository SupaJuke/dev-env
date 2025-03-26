local M = {}

function M.setup()
  require("bufferline").setup {
    highlights = {
      fill = {
        -- bg = '#1A1C1D' -- gruvbox_material_custom
        bg = '#23292D' -- everforest
        -- bg = 'none' -- ?
      },
    },
    options = {
      -- numbers = function(opts)
      --   return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
      -- end,
      numbers = "buffer_id",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        -- if context.buffer:current() then
        --   return ''
        -- end

        local icon = level:match("error") and " " or " "
        return icon .. count
      end,
      indicator = {
        style = "underline"
      },
      separator_style = "thick",
      enforce_regular_tabs = true,
    },
  }
  vim.keymap.set("n", "gb", ":BufferLinePick <CR>", { noremap = true, silent = true })
end

return M
