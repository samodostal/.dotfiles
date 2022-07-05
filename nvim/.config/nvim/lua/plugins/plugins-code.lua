local conf = require('core.utils').plugin_conf

return {
	-----[[------------]]-----
	---         LSP        ---
	-----]]------------[[-----

	{ 'neovim/nvim-lspconfig', config = conf 'lsp.init' },
	{ 'onsails/lspkind.nvim' },
	{ 'williamboman/nvim-lsp-installer' },
	{ 'j-hui/fidget.nvim', config = conf 'fidget' },
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
			'David-Kunz/cmp-npm',
			'saadparwaiz1/cmp_luasnip',
		},
	},
	{ 'github/copilot.vim' },

	-----[[------------]]-----
	---   File switching   ---
	-----]]------------[[-----

	{ 'ThePrimeagen/harpoon' },
	{
		'nvim-telescope/telescope.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
	},
}
