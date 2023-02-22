local conf = require('core.utils').plugin_conf

return {
	-----[[------------]]-----
	---       Install      ---
	-----]]------------[[-----

	{
		'williamboman/mason.nvim',
		dependencies = {
			'WhoIsSethDaniel/mason-tool-installer.nvim',
		},
		config = conf 'mason.init',
	},

	-----[[------------]]-----
	---         LSP        ---
	-----]]------------[[-----

	{
		'neovim/nvim-lspconfig',
		config = conf 'lsp.init',
		dependencies = {
			{ 'williamboman/mason-lspconfig.nvim' },

			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lua' },

			{ 'dcampos/nvim-snippy' },
			{ 'dcampos/cmp-snippy' },
			{ 'honza/vim-snippets' },

			{ 'lvimuser/lsp-inlayhints.nvim' },
			{ 'ray-x/lsp_signature.nvim' },
			{ 'onsails/lspkind.nvim' },
		},
	},

	{
		'utilyre/barbecue.nvim',
		config = conf 'barbecue',
		dependencies = {
			'SmiteshP/nvim-navic',
		},
	},

	{ 'stevearc/aerial.nvim', config = conf 'aerial' },
	{ 'petertriho/nvim-scrollbar', config = conf 'scrollbar' },

	{
		'zbirenbaum/copilot.lua',
		event = 'VimEnter',
		config = conf 'copilot',
	},

	-----[[------------]]-----
	---  Language specific  ---
	-----]]------------[[-----

	{ 'jose-elias-alvarez/typescript.nvim', config = conf 'typescript' },

	-----[[------------]]-----
	---     Debugging      ---
	-----]]------------[[-----

	{
		'rcarriga/nvim-dap-ui',
		config = conf 'dap',
		dependencies = {
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
		dependencies = {
			'kyazdani42/nvim-web-devicons',
		},
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	{
		'kyazdani42/nvim-tree.lua',
		config = conf 'tree',
		commit = '4e24505e2b30c4a8c35a3dfb4f564f14f6d9bfd4',
	},

	-----[[------------]]-----
	---        Git         ---
	-----]]------------[[-----

	{ 'lewis6991/gitsigns.nvim', config = conf 'gitsigns' },
	{ 'kdheepak/lazygit.nvim', config = conf 'lazygit' },

	-----[[------------]]-----
	---      Editing       ---
	-----]]------------[[-----

	{
		'windwp/nvim-autopairs',
		config = conf 'autopairs',
	},
	{ 'Wansmer/treesj', config = conf 'treesj' },
}
