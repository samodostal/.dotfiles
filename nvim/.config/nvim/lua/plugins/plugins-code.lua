local conf = require("core.utils").plugin_conf

return {
	-----[[------------]]-----
	---         LSP        ---
	-----]]------------[[-----

	{ "neovim/nvim-lspconfig", config = conf("lsp.init") },
	{ "onsails/lspkind.nvim" },
	{ "williamboman/nvim-lsp-installer" },
	{ "j-hui/fidget.nvim", config = conf("fidget") },
	{ "zbirenbaum/copilot.lua", event = { "VimEnter" }, config = conf("copilot") },
	{
		"hrsh7th/nvim-cmp",
		config = conf("cmp"),
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
