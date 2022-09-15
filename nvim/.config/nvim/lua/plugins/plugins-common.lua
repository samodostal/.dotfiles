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
	{ 'nvim-treesitter/playground' },
	{ 'windwp/nvim-ts-autotag' },
	{ 'JoosepAlviste/nvim-ts-context-commentstring' },
	{ 'nvim-treesitter/nvim-treesitter-textobjects', config = conf 'treesitter-textobjects' },

	-----[[------------]]-----
	---       Theme        ---
	-----]]------------[[-----

	{ 'sainnhe/gruvbox-material' },
	{ '~/Projects/nvim_plugins/image.nvim', config = conf 'image' },
	{
		'glepnir/galaxyline.nvim',
		config = conf 'galaxyline',
	},
	{ 'norcalli/nvim-colorizer.lua', config = conf 'colorizer' },
	{ 'lukas-reineke/indent-blankline.nvim', config = conf 'indent-blankline' },

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

	{ 'unblevable/quick-scope' },

	-----[[------------]]-----
	---        Other       ---
	-----]]------------[[-----

	{ 'christoomey/vim-tmux-navigator' },
}
