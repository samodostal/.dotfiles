require 'core.options'
require 'core.utils'

local plugins = require 'plugins'
plugins.init()
plugins.load('common', 'note')

require 'core.theme'
