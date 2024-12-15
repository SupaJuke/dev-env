local M = {}

function M.setup()
  require("blink.cmp").setup {
    opts = {
      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, via `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- optionally disable cmdline completions
        -- cmdline = {},
      },

      -- experimental signature help support
      -- signature = { enabled = true }
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" },

    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = {
      ["<D-c>"] = { "show" },
      ["<S-CR>"] = { "hide" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<PageDown>"] = { "scroll_documentation_down" },
      ["<PageUp>"] = { "scroll_documentation_up" },
    },

    -- TODO: make sure documentation shows up
    windows = {
      documentation = {
        border = vim.g.borderStyle,
        min_width = 15,
        max_width = 45, -- smaller, due to https://github.com/Saghen/blink.cmp/issues/194
        max_height = 10,
        auto_show = true,
        auto_show_delay_ms = 250,
      },
      autocomplete = {
        border = vim.g.borderStyle,
        min_width = 10,               -- max_width controlled by draw-function
        max_height = 10,
        cycle = { from_top = false }, -- cycle at bottom, but not at the top
        draw = function(ctx)
          -- https://github.com/Saghen/blink.cmp/blob/9846c2d2bfdeaa3088c9c0143030524402fffdf9/lua/blink/cmp/types.lua#L1-L6
          -- https://github.com/Saghen/blink.cmp/blob/9846c2d2bfdeaa3088c9c0143030524402fffdf9/lua/blink/cmp/windows/autocomplete.lua#L298-L349
          -- differentiate LSP snippets from user snippets and emmet snippets
          local source, client = ctx.item.source_id, ctx.item.client_id
          if
              client and vim.lsp.get_client_by_id(client).name == "emmet_language_server"
          then
            source = "emmet"
          end

          local sourceIcons = { snippets = "󰩫", buffer = "󰦨", emmet = "" }
          local icon = sourceIcons[source] or ctx.kind_icon

          return {
            {
              " " .. ctx.item.label .. " ",
              fill = true,
              hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
              max_width = 40,
            },
            { icon .. " ", hl_group = "BlinkCmpKind" .. ctx.kind },
          }
        end,
      },
    },
  }
end

return M
