local M = {}

function M.setup()
  require("blink.cmp").setup {
    appearance = {
      nerd_font_variant = "mono",
      kind_icons = {
        Snippet = "", -- change this to any icon/text you want
      },
    },

    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        }
      },

      -- Appearance
      menu = {
        scrollbar = false,
        border = "rounded",
        draw = {
          treesitter = { "lsp" },
          align_to = "label",
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        treesitter_highlighting = true,
        window = {
          scrollbar = false,
          border = "rounded",
        }
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    sources = {
      default = { "lsp", "path", "snippets", "buffer", "latex_symbols", "vimtex" },
      providers = {
        latex_symbols = {
          name = "latex_symbols",
          module = "blink.compat.source",
        },
        vimtex = {
          name = "vimtex",
          min_keyword_length = 2,
          module = "blink.compat.source",
          score_offset = 10
        }
      },
    },

    -- experimental signature help support
    signature = { enabled = true },

    keymap = {
      ["<D-c>"] = { "show" },
      ["<S-CR>"] = { "hide" },

      ["<Tab>"] = { "select_and_accept", "fallback" },

      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },

      ["<PageDown>"] = { "scroll_documentation_down" },
      ["<PageUp>"] = { "scroll_documentation_up" },
    },

  }
end

return M
