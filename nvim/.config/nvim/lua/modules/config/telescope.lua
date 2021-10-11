return function()
  local actions = require 'telescope.actions'
  local sorters = require 'telescope.sorters'

  require('telescope').setup {
    defaults = {
      prompt_prefix = '> ',
      selection_caret = '> ',
      layout_config = {
        horizontal = {
          mirror = false
        },
        vertical= {
          mirror = true
        }
      },
      file_sorter = sorters.get_fzy_sorter,
      file_ignore_patterns = { 'node_modules/.*', '%.env' },
      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
        },
        n = { ['<C-c>'] = actions.close },
      },
    },
  }
end
