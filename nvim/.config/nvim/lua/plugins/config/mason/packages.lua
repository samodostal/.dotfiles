local M = {}

-- !IMPORTANT! - short names of packgaes
M.managed_separately = {
	'tsserver',
	'hls'
}

M.lsp = {
	'sqls',
	'yaml-language-server',
	'vim-language-server',
	'typescript-language-server',
	'tailwindcss-language-server',
	'rust-analyzer',
	'python-lsp-server',
	'lua-language-server',
	'lemminx',
	'haskell-language-server',
	'intelephense',
	'jdtls',
	'json-lsp',
	'graphql-language-service-cli',
	'html-lsp',
	'gopls',
	'golangci-lint-langserver',
	'eslint-lsp',
	'dockerfile-language-server',
	'css-lsp',
	'cmake-language-server',
	'clangd',
	'bash-language-server',
	'arduino-language-server',
	'ansible-language-server',
	'efm',
	'csharp-language-server',
}

M.dap = {
	'go-debug-adapter',
	'node-debug2-adapter',
	'chrome-debug-adapter',
	'debugpy',
}

return M
