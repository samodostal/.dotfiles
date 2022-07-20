local prettier_eslint_d = { formatCommand = "prettier-eslint_d --write ${INPUT}", formatStdin = true }
local stylua = { formatCommand = "stylua -s -", formatStdin = true }

return {
	lua = { stylua },
	javascript = { prettier_eslint_d },
	typescript = { prettier_eslint_d },
	javascriptreact = { prettier_eslint_d },
	typescriptreact = { prettier_eslint_d },
}
