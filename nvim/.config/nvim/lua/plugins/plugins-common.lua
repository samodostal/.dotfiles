local conf = require('core.utils').plugin_conf

return {
	-----[[------------]]-----
	---       General      ---
	-----]]------------[[-----

	{ 'nvim-lua/plenary.nvim' },
	{ 'lewis6991/impatient.nvim', config = conf 'impatient' },
	{ 'alexghergh/nvim-tmux-navigation' },
	{ 'MunifTanjim/nui.nvim' },

	-----[[------------]]-----
	---     TreeSitter     ---
	-----]]------------[[-----

	{
		'nvim-treesitter/nvim-treesitter',
		config = conf 'treesitter',
	},
	{ 'nvim-treesitter/playground' },
	{ 'windwp/nvim-ts-autotag' },
	{ 'JoosepAlviste/nvim-ts-context-commentstring' },
	{ 'nvim-treesitter/nvim-treesitter-textobjects', config = conf 'treesitter-textobjects' },

	-----[[------------]]-----
	---       Theme        ---
	-----]]------------[[-----

	{ 'sainnhe/gruvbox-material' },
	{ 'shaunsingh/oxocarbon.nvim' },
	{ 'xiyaowong/nvim-transparent', config = conf 'transparent' },
	{ '~/Projects/nvim_plugins/image.nvim', requires = {
		{ 'm00qek/baleia.nvim' },
	}, config = conf 'image' },
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
}
