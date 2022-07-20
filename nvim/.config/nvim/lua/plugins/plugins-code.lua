local conf = require("core.utils").plugin_conf

return {
	-----[[------------]]-----
	---       Install      ---
	-----]]------------[[-----

	{
		"williamboman/mason.nvim",
		branch = "alpha",
		config = conf("mason"),
	},

	-----[[------------]]-----
	---         LSP        ---
	-----]]------------[[-----

	{ "neovim/nvim-lspconfig", config = conf("lsp.init") },
	{ "williamboman/nvim-lsp-installer" },
	{ "onsails/lspkind.nvim" },
	{ "j-hui/fidget.nvim", config = conf("fidget") },
	{ "petertriho/nvim-scrollbar", config = conf("scrollbar") },
	{
		"L3MON4D3/LuaSnip",
		requires = {
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = conf("cmp"),
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"David-Kunz/cmp-npm",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{
		"~/Projects/nvim_plugins/copilot-client.lua",
		config = conf("copilot"),
		requires = {
			"zbirenbaum/copilot.lua",
		},
	},

	-----[[------------]]-----
	---   File switching   ---
	-----]]------------[[-----

	{ "ThePrimeagen/harpoon" },
	{
		"nvim-telescope/telescope.nvim",
		config = conf("telescope"),
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	{ "kyazdani42/nvim-tree.lua", config = conf("tree") },

	-----[[------------]]-----
	---        Git         ---
	-----]]------------[[-----

	{ "lewis6991/gitsigns.nvim", config = conf("gitsigns") },

	-----[[------------]]-----
	---      Editing       ---
	-----]]------------[[-----

	{
		"windwp/nvim-autopairs",
		config = conf("autopairs"),
	},

	-----[[------------]]-----
	---     Debugging      ---
	-----]]------------[[-----

	{ "mfussenegger/nvim-dap", config = conf("dap") },
}
