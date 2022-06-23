require 'core.options'
require 'core.utils'

local plugins = require 'plugins'
plugins.init()
plugins.load('common')

require 'core.theme'
