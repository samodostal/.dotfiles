local function conf(name)
	return require(string.format("modules.config.%s", name))
end

return {
	-----[[------------]]-----
	---     Development    ---
	-----]]------------[[-----

	{ "~/Projects/nvim_plugins/image.nvim", config = conf("image") },

	-----[[------------]]-----
	---       General      ---
	-----]]------------[[-----

	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },
	{
		"kyazdani42/nvim-web-devicons",
		config = conf("nvim-web-devicons"),
	},

	-----[[------------]]-----
	---        Git         ---
	-----]]------------[[-----

	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		config = conf("gitsigns"),
	},

	-----[[------------]]-----
	---        LSP         ---
	-----]]------------[[-----

	-- { "github/copilot.vim" },
	{ "samodostal/copilot.vim" },
	{
		"nvim-treesitter/nvim-treesitter",
		config = conf("nvim-treesitter"),
		run = ":TSUpdate",
	},
	{
		"neovim/nvim-lspconfig",
		config = conf("nvim-lspconfig"),
	},
	{
		"hrsh7th/nvim-cmp",
		config = conf("nvim-cmp"),
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip" },
			{ "onsails/lspkind-nvim" },
		},
	},
	{ "mfussenegger/nvim-jdtls" },
	{ "tpope/vim-surround" },
	{
		"tpope/vim-commentary",
		requires = {
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
	},
	{ "~/Projects/nvim_plugins/nvim-lsp-installer" },
	{
		"simrat39/symbols-outline.nvim",
		config = conf("symbols-outline"),
	},
	{
		"windwp/nvim-autopairs",
		config = conf("nvim-autopairs"),
	},
	{
		"folke/lsp-colors.nvim",
	},

	-----[[------------]]-----
	---        Theme       ---
	-----]]------------[[-----

	{ "gruvbox-community/gruvbox" },
	{
		"NTBBloodbath/galaxyline.nvim",
		config = conf("galaxyline"),
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = conf("nvim-colorizer"),
	},

	-----[[------------]]-----
	---       In file      ---
	-----]]------------[[-----

	{
		"ggandor/lightspeed.nvim",
		config = conf("lightspeed"),
	},
	-- { "unblevable/quick-scope" },
	{
		"mfussenegger/nvim-dap",
		config = conf("nvim-dap"),
	},
	{
		"puremourning/vimspector",
	},
	{
		"rcarriga/nvim-dap-ui",
		config = conf("nvim-dap-ui"),
	},
	{
		"Pocco81/DAPInstall.nvim",
	},

	-----[[------------]]-----
	---Jumping between files--
	-----]]------------[[-----

	{
		"nvim-telescope/telescope.nvim",
		config = conf("telescope"),
		requires = {
			{ "BurntSushi/ripgrep" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	},
	{ "ThePrimeagen/harpoon" },
	{
		"kyazdani42/nvim-tree.lua",
		config = conf("nvim-tree"),
	},

	-----[[------------]]-----
	---       Others       ---
	-----]]------------[[-----

	{ "christoomey/vim-tmux-navigator" },
	{ "mbbill/undotree" },
}
