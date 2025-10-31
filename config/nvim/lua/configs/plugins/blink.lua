local M = {}

function M.setup()
  require("blink.cmp").setup {
    appearance = {
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    completion = {
      documentation = {
        auto_show = true,
        -- border = vim.g.borderStyle,
        auto_show_delay_ms = 250,
      },
      accept = {
        auto_brackets = {
          enabled = true,
        }
      }
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, via `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'markdown' },
      -- optionally disable cmdline completions
      -- cmdline = {},
      providers = {
        markdown = {
          name = 'RenderMarkdown',
          module = 'render-markdown.integ.blink',
          fallbacks = { 'lsp' },
        }
      }
    },

    -- experimental signature help support
    signature = { enabled = true },

    keymap = {
      ["<D-c>"] = { "show" },
      ["<S-CR>"] = { "hide" },
      ["<Tab>"] = { "select_and_accept", "fallback" },
      -- ["<Tab>"] = { "select_next", "fallback" },
      -- ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<PageDown>"] = { "scroll_documentation_down" },
      ["<PageUp>"] = { "scroll_documentation_up" },
    },

  }
end

return M
