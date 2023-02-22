local utils = require 'core.utils'
local table_size = utils.table_size

local M = {}

function M.init()
	local install_path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
	if not vim.loop.fs_stat(install_path) then
		vim.fn.system {
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable',
			install_path,
		}
		print "Lazy.nvim installed, call ':ABC' to install plugins"
	end
	vim.opt.rtp:prepend(install_path)
end

function M.load(...)
	local plugins = {}

	for _, variant in ipairs { ... } do
		local variant_plugins = require('plugins.plugins-' .. variant)
		if table_size(variant_plugins) > 0 then
			for _, plugin in ipairs(variant_plugins) do
				table.insert(plugins, plugin)
			end
		end
	end

	local lazy = require 'lazy'

	lazy.setup(plugins, {})
end

return M
