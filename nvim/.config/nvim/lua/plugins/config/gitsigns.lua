return function()
  require('gitsigns').setup {
    signs = {
      add = { hl = 'GitSignsAdd', text = '+' },
      change = { hl = 'GitSignsChange', text = '~' },
      delete = { hl = 'GitSignsDelete', text = '-' }
    },
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,
    },
  }
end
