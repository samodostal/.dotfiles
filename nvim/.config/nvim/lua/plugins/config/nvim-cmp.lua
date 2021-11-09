return function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local source_mapping = {
    nvim_lsp = "[LSP]",
    buffer = "[Buffer]",
    cmp_tabnine = "[TN]",
    vsnip = "[Snip]",
    path = "[Path]",
  }

  cmp.setup {
    preselect = 'item',
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end,
    },
    mapping = {
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
      ['<C-s>'] = cmp.mapping.complete()
    },
    sources = {
      -- { name = 'cmp_tabnine' },
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'vsnip' },
      { name = 'path' }
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]
        local menu = source_mapping[entry.source.name]
        if entry.source.name == 'cmp_tabnine' then
          if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            menu = entry.completion_item.data.detail .. ' ' .. menu
          end
          vim_item.kind = ''
        end
        vim_item.menu = menu
        return vim_item
      end
      -- format = lspkind.cmp_format({ with_text = true, maxwidth = 50 })
    }
  }
end
