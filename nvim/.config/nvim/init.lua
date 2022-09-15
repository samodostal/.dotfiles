require 'core.options'
require 'core.utils'
require 'core.keymaps'

local plugins = require 'plugins'
plugins.init()
plugins.load('common', 'code', 'note')

require 'core.theme'
require 'startup'

-- local code_block_query = vim.treesitter.parse_query(
-- )
