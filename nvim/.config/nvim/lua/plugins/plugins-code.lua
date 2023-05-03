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
		'folke/neodev.nvim',
		config = 'language/neodev',
	},
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

	-----[[------------]]-----
	---  Language specific  ---
	-----]]------------[[-----

	{
		'jose-elias-alvarez/typescript.nvim',
		config = conf 'language/typescript',
	},
	{
		'barrett-ruth/import-cost.nvim',
		build = 'sh install.sh npm',
		config = conf 'language/import-cost',
	},
	{
		'mrcjkb/haskell-tools.nvim',
		branch = '1.x.x',
		config = conf 'language/haskell',
	},

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
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

			{ 'luc-tielen/telescope_hoogle' },

			{ 'debugloop/telescope-undo.nvim' },

			{ 'nvim-telescope/telescope-frecency.nvim' },
			{ 'kkharji/sqlite.lua' },
		},
	},
	{
		'kyazdani42/nvim-tree.lua',
		config = conf 'tree',
	},

	-----[[------------]]-----
	---        Git         ---
	-----]]------------[[-----

	{ 'lewis6991/gitsigns.nvim', config = conf 'git.gitsigns' },
	{ 'kdheepak/lazygit.nvim', config = conf 'git.lazygit' },

	-----[[------------]]-----
	---      Editing       ---
	-----]]------------[[-----

	{
		'windwp/nvim-autopairs',
		config = conf 'autopairs',
	},
	{ 'Wansmer/treesj', config = conf 'treesj' },

	-----[[------------]]-----
	---         AI         ---
	-----]]------------[[-----
	{
		'zbirenbaum/copilot.lua',
		event = 'VimEnter',
		config = conf 'copilot',
	},
	-- {
	-- 	'jackMort/ChatGPT.nvim',
	-- 	event = 'VeryLazy',
	-- 	config = function()
	-- 		require('chatgpt').setup()
	-- 	end,
	-- },
}
