require 'core.options'
require 'core.utils'
require 'core.keymaps'

local plugins = require 'plugins'
plugins.init()
plugins.load('common', 'code')

require 'core.theme'
