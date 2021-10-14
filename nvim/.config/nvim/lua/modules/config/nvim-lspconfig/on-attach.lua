local utils = require 'core.utils'

local function nmap(key, cmd, opts)
  utils.keymap.buf_map('n', key, cmd, opts)
end

local function lua_nmap(key, cmd, opts)
  nmap(key, '<cmd>lua  ' .. cmd .. '<CR>', opts)
end

return function(client)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

  lua_nmap('K', 'vim.lsp.buf.hover()')
  lua_nmap('gd', 'vim.lsp.buf.definition()')
  lua_nmap('gD', 'vim.lsp.buf.declaration()')
  lua_nmap('gi', 'vim.lsp.buf.implementation()')
  lua_nmap('gr', 'vim.lsp.buf.references()')
  lua_nmap('<leader>ca', 'require("jdtls").code_action()') -- jdtls should also work with other languages, a subset of vim.lsp.buf.code_action()
  lua_nmap('<leader>gh', 'vim.lsp.buf.signature_help()')
  lua_nmap('<leader>rn', 'vim.lsp.buf.rename()')
  lua_nmap('<leader>pd', 'vim.lsp.diagnostic.show_line_diagnostics()')
  lua_nmap('[d', 'vim.lsp.diagnostic.goto_prev()')
  lua_nmap(']d', 'vim.lsp.diagnostic.goto_next()')
  lua_nmap('<leader>fp', 'vim.lsp.buf.formatting()')

  require('lsp_signature').on_attach({
    bind = true,
    floating_window = false,
    hint_prefix = "H: "
  })

  if client.name == 'typescript' then
    client.resolved_capabilities.document_formatting = false
    require('nvim-lsp-ts-utils').setup {}
  end

  -- So that the only client with format capabilities is efm
  -- if client.name ~= 'efm' then
  --   client.resolved_capabilities.document_formatting = true
  -- end
end
