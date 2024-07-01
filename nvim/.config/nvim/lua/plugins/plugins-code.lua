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
			{ 'hrsh7th/cmp-cmdline' },

			{ 'onsails/lspkind.nvim' },

			{ 'dcampos/nvim-snippy' },
			{ 'dcampos/cmp-snippy' },
			{ 'honza/vim-snippets' },

			{ 'lvimuser/lsp-inlayhints.nvim', branch = 'anticonceal' },

			{ 'mfussenegger/nvim-lint' },
			{ 'stevearc/conform.nvim' },
		},
	},
	-- {
	-- 	'folke/neodev.nvim',
	-- 	config = 'language/neodev',
	-- },
	{
		'utilyre/barbecue.nvim',
		config = conf 'barbecue',
		dependencies = {
			'SmiteshP/nvim-navic',
		},
	},
	{
		'j-hui/fidget.nvim',
		config = conf 'fidget',
	},
	{ 'stevearc/aerial.nvim', config = conf 'aerial' },
	{ 'petertriho/nvim-scrollbar', config = conf 'scrollbar' },
	{ 'onsails/diaglist.nvim' },
	{ 'yorickpeterse/nvim-pqf', config = true },

	-----[[------------]]-----
	---  Language specific  ---
	-----]]------------[[-----

	-- {
	-- 	'jose-elias-alvarez/typescript.nvim',
	-- 	config = conf 'language/typescript',
	-- },
	{
		'barrett-ruth/import-cost.nvim',
		build = 'sh install.sh npm',
		config = conf 'language/import-cost',
	},
	-- {
	-- 	'mrcjkb/haskell-tools.nvim',
	-- 	branch = '2.x.x',
	-- 	config = conf 'language/haskell',
	-- },

	-----[[------------]]-----
	---     Debugging      ---
	-----]]------------[[-----

	--	{
	--		'rcarriga/nvim-dap-ui',
	--		config = conf 'dap',
	--		dependencies = {
	--			'mfussenegger/nvim-dap',
	--		},
	--	},

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

			{ 'kkharji/sqlite.lua' },
		},
	},
	{ 'nvim-tree/nvim-tree.lua', config = conf 'tree' },

	-----[[------------]]-----
	---        Git         ---
	-----]]------------[[-----

	{ 'lewis6991/gitsigns.nvim', config = conf 'git.gitsigns' },
	-- { 'kdheepak/lazygit.nvim', config = conf 'git.lazygit' },
	{ dir = '~/Projects/nvim_plugins/lazygit.nvim', config = conf 'git.lazygit' },

	-----[[------------]]-----
	---      Editing       ---
	-----]]------------[[-----

	{ 'windwp/nvim-autopairs', config = true },
	{ 'Wansmer/treesj', config = conf 'treesj' },

	-----[[------------]]-----
	---         AI         ---
	-----]]------------[[-----
	{

		dir = '~/Projects/nvim_plugins/copilot.lua',
		-- 'zbirenbaum/copilot.lua',
		event = 'VimEnter',
		config = conf 'copilot',
	},
}
