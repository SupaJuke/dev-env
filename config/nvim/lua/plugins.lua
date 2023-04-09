return {
  -- ======================== Themes ======================== --

  {
    "sainnhe/gruvbox-material",
    lazy = true,
    priority = 1000,
    config = function()
      require("configs.plugins.gruvbox-material").setup()
    end
  },

  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1001,
    config = function()
      require("configs.plugins.everforest").setup()
    end
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1002,
    config = function()
      require("configs.plugins.tokyonight").setup()
    end
  },

  -- ======================== Editor ======================== --

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.plugins.telescope").setup()
    end
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = true,
    build = "make"
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.plugins.telescope-file-browser").setup()
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    tag = "release",
    config = function()
      require("gitsigns").setup()
    end
  },
  -- ======================= LSP & TS ======================= --

  {
    "neoclide/coc.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    branch = "release",
    config = function()
      require("configs.plugins.coc").setup()
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("configs.plugins.nvim-treesitter").setup()
    end
  },

  -- ========================== UI ========================== --

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require("configs.plugins.lualine").setup()
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("configs.plugins.nvim-tree").setup()
    end
  },

  {
    "akinsho/bufferline.nvim",
    lazy = false,
    version = "v3.*",
    config = function()
      require("configs.plugins.bufferline").setup()
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("configs.plugins.indent-blankline").setup()
    end
  },

  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require("configs.plugins.alpha-nvim").setup()
    end
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require "nvim-web-devicons".get_icons()
    end
  },
}
