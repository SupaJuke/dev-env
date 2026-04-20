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
    lazy = true,
    priority = 1002,
    config = function()
      require("configs.plugins.tokyonight").setup()
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1003,
    config = function()
      require("configs.plugins.kanagawa").setup()
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
    -- dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    -- config = function()
    --   require("configs.plugins.telescope-file-browser").setup()
    -- end,
  },

  { "nvim-telescope/telescope-bibtex.nvim", lazy = true },

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
      require("configs.plugins.autopairs").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.plugins.todo").setup()
    end,
  },

  {
    "whonore/Coqtail",
  },

  -- ======================= LSP ======================= --

  -- lspconfig + mason
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("configs.plugins.nvim-lsp-mason").setup()
    end,
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

  -- Including mini.pairs and mini.snippets
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("configs.plugins.mini").setup()
    end
  },

  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    dependencies = {
      "saghen/blink.compat",
      "rafamadriz/friendly-snippets",
      "kdheepak/cmp-latex-symbols",
    },

    -- use a release tag to download pre-built binaries
    version = 'v1.*',

    config = function()
      require("configs.plugins.blink").setup()
    end,
  },

  -- ========================== UI ========================== --

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
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    dependencies = { "micangl/cmp-vimtex", },
    config = function()
      require("configs.plugins.vimtex").setup()
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    config = function()
      require("configs.plugins.markdown_preview").setup()
    end,
    ft = { "markdown" },
  },
}
