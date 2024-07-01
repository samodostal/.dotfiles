local lspconfig = require 'lspconfig'

return {
	clangd = {
		cmd = {
			'clangd',
			'--background-index',
			'--clang-tidy',
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' },
				},
			},
		},
	},
	-- eslint = {
	-- 	root_dir = lspconfig.util.root_pattern { '.eslintrc.js', '.git/' },
	-- },
	-- tsserver = {
	-- 	settings = {
	-- 		typescript = {
	-- 			inlayHints = {
	-- 				includeInlayParameterNameHints = 'none',
	-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
	-- 				includeInlayFunctionParameterTypeHints = true,
	-- 				includeInlayVariableTypeHints = false,
	-- 				includeInlayPropertyDeclarationTypeHints = true,
	-- 				includeInlayFunctionLikeReturnTypeHints = true,
	-- 				includeInlayEnumMemberValueHints = true,
	-- 			},
	-- 		},
	-- 	},
	-- },
}

-- category thery: page 60
-- how linux works: page 21

