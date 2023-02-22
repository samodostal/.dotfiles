local conf = require('core.utils').plugin_conf

return {
	-----[[------------]]-----
	---       General      ---
	-----]]------------[[-----

	{ 'nvim-lua/plenary.nvim' },
	{ 'alexghergh/nvim-tmux-navigation' },
	{ 'MunifTanjim/nui.nvim' },

	-----[[------------]]-----
	---     TreeSitter     ---
	-----]]------------[[-----

	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = conf 'treesitter',
	},
	{ 'nvim-treesitter/playground' },
	{ 'windwp/nvim-ts-autotag' },
	{ 'JoosepAlviste/nvim-ts-context-commentstring' },
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		config = conf 'treesitter-textobjects',
	},

	-----[[------------]]-----
	---       Theme        ---
	-----]]------------[[-----

	-- { 'sainnhe/gruvbox-material' },
	{ 'ellisonleao/gruvbox.nvim' },
	{
		dir = '~/Projects/nvim_plugins/image.nvim',
		dependencies = {
			{ 'm00qek/baleia.nvim' },
		},
		config = conf 'image',
	},
	{ 'norcalli/nvim-colorizer.lua', config = conf 'colorizer' },
	{ 'lukas-reineke/indent-blankline.nvim', config = conf 'indent-blankline' },
	{ 'akinsho/bufferline.nvim', config = conf 'bufferline' },

	-----[[------------]]-----
	---      TPope <3      ---
	-----]]------------[[-----

	{ 'tpope/vim-commentary' },
	{ 'tpope/vim-surround' },
	{ 'tpope/vim-repeat' },
	{ 'tpope/vim-abolish' },
	{ 'tpope/vim-sleuth' },
	{ 'tpope/vim-eunuch' },

	-----[[------------]]-----
	---      Movement      ---
	-----]]------------[[-----

	{ 'ggandor/leap.nvim', config = conf 'leap' },
	{ 'abecodes/tabout.nvim', config = conf 'tabout' },

	-----[[------------]]-----
	---        Other       ---
	-----]]------------[[-----

	{ 'gbprod/yanky.nvim', config = conf 'yanky' },
	{ 'makerj/vim-pdf' },
}
