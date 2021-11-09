return function(client)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

  require('lsp_signature').on_attach({
    bind = true,
    floating_window = false,
    hint_prefix = "H: "
  })

  if client.name == 'typescript' then
    client.resolved_capabilities.document_formatting = false
    require('nvim-lsp-ts-utils').setup {}
  end
end
