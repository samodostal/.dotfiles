require 'core.options'
require 'core.keymaps'

local plugins = require 'plugins'
plugins.init()
plugins.load('common', 'code', 'note')

require 'core.theme'

require 'core.scripts.startup'
require 'core.scripts.bufenter'

-- format all files: 'stylua --config-path ./.stylua.toml  -g '*.lua' .'
