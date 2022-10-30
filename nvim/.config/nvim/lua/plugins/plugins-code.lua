local conf = require('core.utils').plugin_conf

return {
	-----[[------------]]-----
	---       Install      ---
	-----]]------------[[-----

	{ 'williamboman/mason.nvim', config = conf 'mason.init' },
	{ 'WhoIsSethDaniel/mason-tool-installer.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },

	-----[[------------]]-----
	---         LSP        ---
	-----]]------------[[-----

	{ 'neovim/nvim-lspconfig', config = conf 'lsp.init' },
	{ 'lvimuser/lsp-inlayhints.nvim', config = conf 'lsp.inlayhints' },
	{ 'onsails/lspkind.nvim' },
	{ 'ray-x/lsp_signature.nvim' },
	{ 'j-hui/fidget.nvim', config = conf 'fidget' },
	{ 'petertriho/nvim-scrollbar', config = conf 'scrollbar' },
	{
		'L3MON4D3/LuaSnip',
		requires = {
			'rafamadriz/friendly-snippets',
		},
	},
	{
		'hrsh7th/nvim-cmp',
		config = conf 'cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lua',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-cmdline',
		},
	},
	{
		'~/Projects/nvim_plugins/copilot-client.lua',
		config = conf 'copilot',
		requires = {
			'zbirenbaum/copilot.lua',
		},
	},

	-----[[------------]]-----
	---     Debugging      ---
	-----]]------------[[-----

	{
		'rcarriga/nvim-dap-ui',
		config = conf 'dap',
		requires = {
			'mfussenegger/nvim-dap',
		},
	},

	-----[[------------]]-----
	---   File switching   ---
	-----]]------------[[-----

	{ 'ThePrimeagen/harpoon' },
	{
		'nvim-telescope/telescope.nvim',
		config = conf 'telescope',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
	{ 'kyazdani42/nvim-tree.lua', config = conf 'tree', commit = '4e24505e2b30c4a8c35a3dfb4f564f14f6d9bfd4' },

	-----[[------------]]-----
	---        Git         ---
	-----]]------------[[-----

	{ 'lewis6991/gitsigns.nvim', config = conf 'gitsigns' },
	{ 'kdheepak/lazygit.nvim', config = conf 'lazygit' },
	{ 'pwntester/octo.nvim', config = conf 'octo' },

	-----[[------------]]-----
	---      Editing       ---
	-----]]------------[[-----

	{ 'stevearc/aerial.nvim', config = conf 'aerial' },
	{
		'windwp/nvim-autopairs',
		config = conf 'autopairs',
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
	},
	{ 'aarondiel/spread.nvim' },
}
