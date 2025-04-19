return {
  -- ======================== Themes ======================== --

  {
    "sainnhe/gruvbox-material",
    lazy = true,
    priority = 1000,
    config = function()
      require("configs.plugins.gruvbox-material").setup()
    end,
  },

  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1001,
    config = function()
      require("configs.plugins.everforest").setup()
    end,
  },

  {
    "folke/tokyonight.nvim",
    -- disabled = true,
    lazy = false,
    priority = 1002,
    config = function()
      require("configs.plugins.tokyonight").setup()
    end,
  },

  -- ======================== Editor ======================== --

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("configs.plugins.nvim-treesitter").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    -- tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.plugins.telescope").setup()
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = true,
    build = "make",
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.plugins.telescope-file-browser").setup()
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    tag = "release",
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.plugins.todo-comments").setup()
    end,
  },

  -- ======================= LSP ======================= --

  -- lspconfig + mason
  -- [TODO]: eventually migrate to native?
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    -- event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.plugins.nvim-lsp-mason").setup()
    end,
  },

  -- Formatters
  {
    "lukas-reineke/lsp-format.nvim",
    lazy = false,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = false, lsp_fallback = true })
        end,
        desc = "format file"
      },
    },
    config = function()
      require("configs.plugins.nvim-conform").setup()
    end,
  },

  -- Autocompletion
  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = 'v1.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    config = function()
      require("configs.plugins.blink").setup()
    end,
  },

  -- ========================== UI ========================== --

  {
    "echasnovski/mini.nvim",
    version = false,
  },

  {
    "folke/which-key.nvim",
    lazy = false,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Keymaps",
      },
    },
    config = function()
      require("configs.plugins.whichkey").setup()
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require("configs.plugins.lualine").setup()
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("configs.plugins.neo-tree").setup()
    end,
  },

  {
    "akinsho/bufferline.nvim",
    lazy = false,
    version = "*",
    config = function()
      require("configs.plugins.bufferline").setup()
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("configs.plugins.indent-blankline").setup()
    end,
  },

  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require("configs.plugins.alpha-nvim").setup()
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").get_icons()
    end,
  },

  -- ======================= External ======================= --
  {
    -- TODO: change the order of the icons (i fucking hate circles -> do diamonds instead)
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  }
}
