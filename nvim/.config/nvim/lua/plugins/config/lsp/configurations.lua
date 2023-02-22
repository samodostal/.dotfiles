local lspconfig = require 'lspconfig'
local format_config = require 'plugins.config.lsp.format'

return {
	efm = {
		init_options = { documentFormatting = true },
		filetypes = vim.tbl_keys(format_config),
		root_dir = lspconfig.util.root_pattern { '.git/', '.stylua.toml' },
		settings = { languages = format_config },
	},
	lua_ls = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
		},
	},
	clangd = {
		cmd = {
			'clangd',
			'--background-index',
			'--clang-tidy',
			'--offset-encoding=utf-16',
		},
	},
	eslint = {
		root_dir = lspconfig.util.root_pattern { '.eslintrc.js', '.git/' },
	},
	tsserver = {
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = 'none',
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = false,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		},
	},
}
