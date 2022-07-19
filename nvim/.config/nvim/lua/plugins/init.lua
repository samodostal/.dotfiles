local utils = require 'core.utils'
local table_size = utils.table_size

local M = {}

function M.init()
	local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
		vim.cmd 'packadd packer.nvim'
		print "Packer installed, call ':PackerSync' to install packages"
	end
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

	local packer = require 'packer'

	packer.init {}

	packer.use 'wbthomason/packer.nvim'
	for _, plugin in ipairs(plugins) do
		packer.use(plugin)
	end
end

return M
