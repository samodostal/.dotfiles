local conf = require('core.utils').plugin_conf

return {
	-----[[------------]]-----
	---       General      ---
	-----]]------------[[-----

	{ 'nvim-lua/plenary.nvim' },
	{ 'alexghergh/nvim-tmux-navigation' },
	{ 'MunifTanjim/nui.nvim' },
	{ 'nvim-tree/nvim-web-devicons', config = true },

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

	{ 'ellisonleao/gruvbox.nvim' },
	{
		'3rd/image.nvim',
		config = conf 'image',
		dependencies = {
			{ 'dfendr/clipboard-image.nvim' },
		},
	},
	{ 'norcalli/nvim-colorizer.lua', config = conf 'colorizer' },
	{ 'lukas-reineke/indent-blankline.nvim', tag = 'v2.20.8', config = conf 'indent-blankline' },
	{ 'akinsho/bufferline.nvim', config = conf 'bufferline' },
	{ 'xiyaowong/nvim-cursorword' },
	{ 'pocco81/high-str.nvim' },

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

	{
		'folke/flash.nvim',
		keys = {
			{
				's',
				mode = { 'n', 'x', 'o' },
				function()
					require('flash').jump()
				end,
				desc = 'Flash',
			},
			{
				'S',
				mode = { 'n', 'x', 'o' },
				function()
					require('flash').treesitter()
				end,
				desc = 'Flash Treesitter',
			},
			{
				'r',
				mode = 'o',
				function()
					require('flash').remote()
				end,
				desc = 'Remote Flash',
			},
			{
				'R',
				mode = { 'o', 'x' },
				function()
					require('flash').treesitter_search()
				end,
				desc = 'Treesitter Search',
			},
			{
				'<c-s>',
				mode = { 'c' },
				function()
					require('flash').toggle()
				end,
				desc = 'Toggle Flash Search',
			},
		},
	},
	{ 'abecodes/tabout.nvim', config = conf 'tabout' },

	-----[[------------]]-----
	---       Layout       ---
	-----]]------------[[-----

	{
		'folke/edgy.nvim',
		config = conf 'edgy',
	},

	-----[[------------]]-----
	---        Other       ---
	-----]]------------[[-----

	{ 'gbprod/yanky.nvim', config = conf 'yanky' },
	{ 'ziontee113/color-picker.nvim', config = true },
	{ 'codethread/qmk.nvim', config = conf 'qmk' },
}
