local conf = require('core.utils').plugin_conf

return {
	-----[[------------]]-----
	---       General      ---
	-----]]------------[[-----

	{ 'nvim-lua/plenary.nvim' },

	-----[[------------]]-----
	---     TreeSitter     ---
	-----]]------------[[-----

	{
		'nvim-treesitter/nvim-treesitter',
		config = conf 'treesitter',
	},
	{ 'windwp/nvim-ts-autotag' },
	{ 'JoosepAlviste/nvim-ts-context-commentstring' },

	-----[[------------]]-----
	---       Theme        ---
	-----]]------------[[-----

	{ 'sainnhe/gruvbox-material' },
	{
		'glepnir/galaxyline.nvim',
		config = conf 'galaxyline',
	},
	{ 'norcalli/nvim-colorizer.lua', config = conf 'colorizer' },

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

	-----[[------------]]-----
	---        Other       ---
	-----]]------------[[-----

	{ 'christoomey/vim-tmux-navigator' },
}
