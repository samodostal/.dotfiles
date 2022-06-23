require 'core.options'
require 'core.utils'

local plugins = require 'plugins'
plugins.init()
plugins.load('common', 'code')

require 'core.theme'
