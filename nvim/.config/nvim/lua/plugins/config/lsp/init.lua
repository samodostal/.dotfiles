return function()
  local lspconfig = safe_require 'lspconfig'
  local lsp_installer = safe_require 'nvim-lsp-installer'

  if not lspconfig or not lsp_installer then
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
    'graphql',
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
      settings = { languages = format_config },
    },
    sumneko_lua = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  }

  lsp_installer.setup {
    ensure_installed = servers,
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  for _, server in ipairs(servers) do
    local config = servers_config[server] or {}
    config.on_attach = on_attach
    config.capabilities = capabilities
    lspconfig[server].setup(config)
  end
end
