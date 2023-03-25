return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
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
    version = "v3.*",
    config = function()
      require("configs.plugins.bufferline").setup()
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('configs.plugins.nvim-treesitter').setup()
    end
  },

  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      require('configs.plugins.coc').setup()
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('configs.plugins.telescope').setup()
    end
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require('configs.plugins.telescope-file-browser').setup()
    end
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },

  {
    'lewis6991/gitsigns.nvim',
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
    config = function()
      require 'nvim-web-devicons'.get_icons()
    end
  },
}
