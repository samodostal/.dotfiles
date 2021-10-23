return function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  local check_back_space = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
  end

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
      ['<C-s>'] = cmp.mapping.complete(),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t '<C-n>', 'n')
        elseif vim.fn.call('vsnip#available', { 1 }) == 1 then
          vim.fn.feedkeys(t '<Plug>(vsnip-expand-or-jump)', '')
        elseif check_back_space() then
          vim.fn.feedkeys(t '<Tab>', 'n')
        else
          fallback()
        end
      end, {
        'i',
        's',
      }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t '<C-p>', 'n')
        elseif vim.fn.call('vsnip#jumpable', { -1 }) == 1 then
          vim.fn.feedkeys(t '<Plug>(vsnip-jump-prev)', '')
        else
          fallback()
        end
      end, {
        'i',
        's',
      }),
    },
    sources = {
      { name = 'cmp_tabnine' },
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
