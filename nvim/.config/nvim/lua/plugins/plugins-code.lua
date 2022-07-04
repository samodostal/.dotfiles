return {
	-----[[------------]]-----
	---         LSP        ---
	-----]]------------[[-----

	{ "neovim/nvim-lspconfig", config = "lsp.init" },
	{ "williamboman/nvim-lsp-installer" },
	{ "j-hui/fidget.nvim", config = "fidget" },
	{ "zbirenbaum/copilot.lua", config = "copilot" },
	{
		"hrsh7th/nvim-cmp",
		config = "cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"David-Kunz/cmp-npm",
			"zbirenbaum/copilot-cmp",
		},
	},
}
