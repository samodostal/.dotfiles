require 'core.options'
require 'core.keymaps'

local plugins = require 'plugins'

plugins.init()
plugins.load('common', 'code', 'note')

require 'core.theme'

require 'core.scripts.startup'
require 'core.scripts.bufenter'
