return function()
	local lspconfig = safe_require("lspconfig")
	if not lspconfig then
		return
	end

	local on_attach = require("modules.config.nvim-lspconfig.on-attach")
	local format_config = require("modules.config.nvim-lspconfig.format")
	require("modules.config.nvim-lspconfig.ui").setup()

	local servers = {
		efm = {
			filetypes = vim.tbl_keys(format_config),
			init_options = { documentFormatting = true },
			root_dir = lspconfig.util.root_pattern({ ".git/", ".prettierrc" }),
			settings = { languages = format_config },
		},
		graphql = {
			filetypes = { "graphql" },
		},
		diagnosticls = {
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			root_dir = lspconfig.util.root_pattern({ "package.json", "node_modules/", ".git/" }),
		},
		clangd = {
			cmd = {
				"/Users/samueldostal/.local/share/nvim/lsp_servers/clangd/clangd",
				"--background-index",
				"--clang-tidy",
			},
		},
		-- golangci_lint_ls = {
		-- 	cmd = { "golangci-lint-langserver" },
		-- 	filetypes = { "go", "gomod" },
		-- 	init_options = {
		-- 		command = { "golangci-lint", "run", "--out-format", "json" },
		-- 	},
		-- 	root_dir = lspconfig.util.root_pattern("go.work") or lspconfig.util.root_pattern(
		-- 		"go.mod",
		-- 		".golangci.yaml",
		-- 		".git"
		-- 	),
		-- },
	}

	local function get_config(server_name)
		local config = servers[server_name] or {}
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		if package.loaded["cmp_nvim_lsp"] then
			capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
		end
		config.on_attach = on_attach
		return config
	end

	require("nvim-lsp-installer").on_server_ready(function(server)
		server:setup(get_config(server.name))
		vim.cmd([[ do User LspAttachBuffers ]])
	end)
end
