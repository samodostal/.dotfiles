local conf = require('core.utils').plugin_conf

return {
	-----[[------------]]-----
	---       General      ---
	-----]]------------[[-----

	{ 'nvim-lua/plenary.nvim' },
	{
		'nvim-treesitter/nvim-treesitter',
		config = conf 'nvim-treesitter',
		run = ':TSUpdate',
	},
	{ 'JoosepAlviste/nvim-ts-context-commentstring' },

	-----[[------------]]-----
	---       Theme        ---
	-----]]------------[[-----

	{ 'sainnhe/gruvbox-material' },
	{ 'norcalli/nvim-colorizer.lua', config = conf 'nvim-colorizer' },

	-----[[------------]]-----
	---      TPope <3      ---
	-----]]------------[[-----

	{ 'tpope/vim-commentary' },
	{ 'tpope/vim-surround' },
	{ 'tpope/vim-repeat' },
	{ 'tpope/vim-abolish' },
	{ 'tpope/vim-sleuth' },
	{ 'tpope/vim-vinegar' },
	{ 'tpope/vim-eunuch' },

	-----[[------------]]-----
	---      Movement      ---
	-----]]------------[[-----

	{ 'ggandor/leap.nvim', config = conf 'leap' },

	-----[[------------]]-----
	---        Other       ---
	-----]]------------[[-----

	{ 'christoomey/vim-tmux-navigator' },
}
