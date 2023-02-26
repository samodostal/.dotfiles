local prettier = { formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true }
local stylua = { formatCommand = 'stylua -s -', formatStdin = true } -- format all files: 'stylua --config-path ./.stylua.toml  -g '*.lua' .'
local clang = { formatCommand = 'clang-format -style=LLVM ${INPUT}', formatStdin = true }
local black = { formatCommand = 'black --quiet --line-length 78 -', formatStdin = true }
local haskell = { formatCommand = 'ormolu --no-cabal --unsafe --mode stdout ${INPUT}', formatStdin = true }

return {
	lua = { stylua },
	javascript = { prettier },
	typescript = { prettier },
	javascriptreact = { prettier },
	typescriptreact = { prettier },
	yaml = { prettier },
	cpp = { clang },
	c = { clang },
	python = { black },
	haskell = { haskell },
}
