local prettier = { formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true }
local stylua = { formatCommand = 'stylua -s -', formatStdin = true }
local clang = { formatCommand = 'clang-format -style=LLVM ${INPUT}', formatStdin = true }

return {
	lua = { stylua },
	javascript = { prettier },
	typescript = { prettier },
	javascriptreact = { prettier },
	typescriptreact = { prettier },
	yaml = { prettier },
	cpp = { clang },
	c = { clang },
}
