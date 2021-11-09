return function()
  local lspconfig = require 'lspconfig'
  local lspinstall = require 'lspinstall'
  local on_attach = require 'plugins.config.nvim-lspconfig.on-attach'
  local format_config = require 'plugins.config.nvim-lspconfig.format'
  require('plugins.config.nvim-lspconfig.ui').symbols_override()
  require('plugins.config.nvim-lspconfig.ui').disable_virtual_text()

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { 'documentation', 'detail', 'additionalTextEdits' },
  }

local filetypes = {
    typescript = "eslint",
    typescriptreact = "eslint",
}

local linters = {
    eslint = {
        sourceName = "eslint",
        command = "eslint_d",
        rootPatterns = {".eslintrc.js",".eslintrc.json", "package.json"},
        debounce = 100,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
        },
        securities = {[2] = "error", [1] = "warning"}
    }
}

local formatters = {
    prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
}

local formatFiletypes = {
    typescript = "prettier",
    typescriptreact = "prettier"
}

  local servers = {
    efm = {
      init_options = { documentFormatting = true, codeAction = true },
      root_dir = lspconfig.util.root_pattern { '.git/', '.' },
      filetypes = vim.tbl_keys(format_config),
      settings = { languages = format_config },
    },
    lua = {
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
          completion = { keywordSnippet = 'Both' },
          runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
          },
          workspace = {
            library = vim.list_extend({ [vim.fn.expand '$VIMRUNTIME/lua'] = true }, {}),
          },
        },
      },
    },
    tsserver = {
      root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git")
    },
    diagnosticls = {
      root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "typescript.tsx", "javascript.tsx" },
      init_options = {
          filetypes = filetypes,
          linters = linters,
          formatters = formatters,
          formatFiletypes = formatFiletypes
      }
    },
    
  }

  -- Setup servers
  local function setup_servers()
    lspinstall.setup()
    local installed = lspinstall.installed_servers()
    for _, server in pairs(installed) do
      local config = servers[server] or { root_dir = lspconfig.util.root_pattern { '.git', 'package.json' } }
      config.capabilities = capabilities
      config.on_attach = on_attach
      lspconfig[server].setup(config)
    end
  end

  setup_servers()
end
