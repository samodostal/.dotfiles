local function conf(name)
	return require(string.format("modules.config.%s", name))
end

return {
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

	{ "github/copilot.vim" },
	{
		"nvim-treesitter/nvim-treesitter",
		config = conf("nvim-treesitter"),
	},
	{
		"neovim/nvim-lspconfig",
		config = conf("nvim-lspconfig"),
	},
	{
		"hrsh7th/nvim-cmp",
		config = conf("nvim-cmp"),
	},
	{ "ThePrimeagen/refactoring.nvim" },
	{ "jose-elias-alvarez/nvim-lsp-ts-utils" },
	{ "mfussenegger/nvim-jdtls" },

	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-commentary" },

	{ "windwp/nvim-ts-autotag" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-emoji" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "williamboman/nvim-lsp-installer" },
	{ "ray-x/lsp_signature.nvim" },

	{ "onsails/lspkind-nvim" },
	{ "simrat39/symbols-outline.nvim" },

	{
		"folke/todo-comments.nvim",
		config = conf("todo-comments"),
	},

	{
		"windwp/nvim-autopairs",
		config = conf("nvim-autopairs"),
	},

	-----[[------------]]-----
	---        Theme       ---
	-----]]------------[[-----

	{ "gruvbox-community/gruvbox" },
	{
		"glepnir/galaxyline.nvim",
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
	{ "unblevable/quick-scope" },
	{ "szw/vim-maximizer" },
	{
		"mfussenegger/nvim-dap",
		config = conf("nvim-dap"),
	},
	{
		"rcarriga/nvim-dap-ui",
		config = conf("nvim-dap-ui"),
	},

	-----[[------------]]-----
	---Jumping between files--
	-----]]------------[[-----

	{
		"nvim-telescope/telescope.nvim",
		config = conf("telescope"),
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
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
	{ "davidgranstrom/nvim-markdown-preview" },
	{ "vimwiki/vimwiki" },
}
