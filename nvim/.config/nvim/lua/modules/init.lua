local utils = require 'core.utils'
local packer_repo = 'https://github.com/wbthomason/packer.nvim'
local packer_path = utils.os.data .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  print 'Downloading plugin manager...'
  vim.cmd('silent! !git clone ' .. packer_repo .. ' ' .. packer_path)
end
vim.cmd 'packadd packer.nvim'
vim.opt.rtp:append(utils.os.data .. '/site/pack/packer/opt/*')

local packer = require 'packer'
return packer.startup(function(use)
  packer.init {
    compile_path = utils.os.data .. '/site/lua/packer_compiled.lua',
    opt_default = true,
    profile = { enable = true },
  }

  -- Plugin manager
  use { 'wbthomason/packer.nvim' }

  -- Common dependencies
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use {
    'kyazdani42/nvim-web-devicons',
    setup = require 'modules.config.nvim-web-devicons',
  }

  -----[[------------]]-----
  ---        Git         ---
  -----]]------------[[-----

  use {
    'tpope/vim-fugitive',
  }

  use {
    'lewis6991/gitsigns.nvim',
    setup = require 'modules.config.gitsigns',
  }

  use {
    'stsewd/fzf-checkout.vim',
    -- setup = require 'modules.config.gitsigns',
  }

  use {
    'pwntester/octo.nvim'
  }

  -----[[------------]]-----
  ---        LSP         ---
  -----]]------------[[-----

  use {
    'nvim-treesitter/nvim-treesitter',
    setup = require 'modules.config.nvim-treesitter',
    requires = {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  }

  use {
    'sheerun/vim-polyglot'
  }

  use {
    'neovim/nvim-lspconfig',
    setup = require 'modules.config.nvim-lspconfig',
    requires = {
      { 'kabouzeid/nvim-lspinstall' },
      { 'ray-x/lsp_signature.nvim' },
      { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
    },
  }

  use { 'mfussenegger/nvim-jdtls' }

  use {
    'hrsh7th/nvim-cmp',
    setup = require 'modules.config.nvim-cmp',
    event = 'InsertEnter',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      { 'hrsh7th/vim-vsnip', requires = { 'rafamadriz/friendly-snippets' } },
    },
  }

  use {
    'onsails/lspkind-nvim'
  }

  -- use {
  --   'tzachar/cmp-tabnine',
  --   after = 'nvim-cmp',
  --   setup = require 'modules.config.tabnine',
  --   run = './install.sh',
  --   requires = 'hrsh7th/nvim-cmp'
  -- }

  use {
    'simrat39/symbols-outline.nvim'
  }

  use {
    'folke/todo-comments.nvim',
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
      }
    end
  }

  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    setup = require 'modules.config.nvim-autopairs',
  }

  use { 'tpope/vim-surround', requires = { 'tpope/vim-repeat' } }

  use { 'tpope/vim-commentary' }


  -----[[------------]]-----
  ---        Theme       ---
  -----]]------------[[-----

  use { 'gruvbox-community/gruvbox' }
  use { 'wuelnerdotexe/vim-enfocado' }

  use {
    'glepnir/galaxyline.nvim',
    setup = require 'modules.config.galaxyline',
  }

  use {
    'norcalli/nvim-colorizer.lua',
    setup = require 'modules.config.nvim-colorizer',
  }

  -----[[------------]]-----
  ---       In file      ---
  -----]]------------[[-----

  use { 'unblevable/quick-scope' }
  use { 'mfussenegger/nvim-dap', setup = require 'modules.config.nvim-dap' }
  use { 'rcarriga/nvim-dap-ui', setup = require 'modules.config.nvim-dap-ui' }
  use { 'szw/vim-maximizer' }

  -----[[------------]]-----
  ---Jumping between files--
  -----]]------------[[-----

  use {
    'nvim-telescope/telescope.nvim',
    setup = require 'modules.config.telescope',
  }

  use { 'ThePrimeagen/harpoon' }

  use {
    'kyazdani42/nvim-tree.lua',
    setup = require 'modules.config.nvim-tree',
  }

  -----[[------------]]-----
  ---       Others       ---
  -----]]------------[[-----

  use { 'christoomey/vim-tmux-navigator' }
  use { 'mbbill/undotree' }
  use { 'davidgranstrom/nvim-markdown-preview' }
  use { 'vimwiki/vimwiki' }

  packer.install()
  packer.compile()
end)
