return function()
	local lspconfig = safe_require 'lspconfig'
	local lsp_installer = safe_require 'nvim-lsp-installer'
	local lsp_signature = safe_require 'lsp_signature'

	if not lspconfig or not lsp_installer or not lsp_signature then
		return
	end

	local on_attach = require 'plugins.config.lsp.on-attach'
	local format_config = require 'plugins.config.lsp.format'

	local servers = {
		'efm',
		'sumneko_lua',
		'ansiblels',
		'bashls',
		'clangd',
		'cmake',
		'cssls',
		'dockerls',
		'gopls',
		'golangci_lint_ls',
		'eslint',
		'hls',
		'html',
		'jsonls',
		'pyright',
		'rust_analyzer',
		'tailwindcss',
		'tsserver',
		'yamlls',
	}

	local servers_config = {
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

	lsp_installer.setup {
		ensure_installed = servers,
		max_concurrent_installers = 8,
	}

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

	for _, server in ipairs(servers) do
		local config = servers_config[server] or {}
		config.on_attach = on_attach
		config.capabilities = capabilities
		lspconfig[server].setup(config)
	end

	lsp_signature.setup {
		hint_enable = false
	}
end
