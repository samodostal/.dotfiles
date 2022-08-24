local lspconfig = require 'lspconfig'
local format_config = require 'plugins.config.lsp.format'

return {
	efm = {
		init_options = { documentFormatting = true },
		filetypes = vim.tbl_keys(format_config),
		root_dir = lspconfig.util.root_pattern { '.git/', '.stylua.toml' },
		settings = { languages = format_config },
	},
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' },
				},
			},
		},
	},
}
