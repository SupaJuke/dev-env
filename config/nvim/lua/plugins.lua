return {
  {
    'sainnhe/gruvbox-material',
    lazy = true,
    priority = 1000,
    config = function()
      require('configs.plugins.gruvbox-material').setup()
    end,
  },

  {
    'sainnhe/everforest',
    lazy = false,
    priority = 999,
    config = function()
      require('configs.plugins.everforest').setup()
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
      require('configs.plugins.lualine').setup()
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require("configs.plugins.nvim-tree").setup()
    end,
  },

  {
    'akinsho/bufferline.nvim',
    lazy = false,
    version = "v3.*",
    config = function()
      require("configs.plugins.bufferline").setup()
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('configs.plugins.nvim-treesitter').setup()
    end
  },

  {
    'neoclide/coc.nvim',
    lazy = true,
    branch = 'release',
    config = function()
      require('configs.plugins.coc').setup()
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('configs.plugins.telescope').setup()
    end
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require('configs.plugins.telescope-file-browser').setup()
    end
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = true,
    build = 'make'
  },

  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    tag = 'release',
    config = function()
      require('gitsigns').setup()
    end
  },

  {
    'goolord/alpha-nvim',
    config = function()
      require('configs.plugins.alpha-nvim').setup()
    end
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require 'nvim-web-devicons'.get_icons()
    end
  },
}
