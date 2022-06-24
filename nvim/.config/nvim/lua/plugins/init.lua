local table_size = require('core/utils').table_size

local M = {}

function M.init() 
  local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd 'packadd packer.nvim'
    print("Packer installed, call ':PackerSync' to install packages")
  end
end

function M.load(...)
  local plugins = {}
  local variant_name = ""

  for _, variant in ipairs({...}) do
    local variant_plugins = require('plugins.plugins-' .. variant)
    if(table_size(variant_plugins) > 0) then
      for _, plugin in ipairs(variant_plugins) do
        table.insert(plugins, plugin)
      end
    end
    variant_name = variant_name .. variant
  end

  local packer = safe_require 'packer'

  local package_root = vim.fn.stdpath("data") .. "/site/pack/" .. variant_name .. "/"
  local compile_path = vim.fn.stdpath("data") .. "/plugin/packer_compiled_" .. variant_name .. ".lua"

	packer.init({
    package_root = package_root,
		compile_path = compile_path,
	})

  -- Add plugins to runtimepath manually
  vim.opt.runtimepath:append('~/.local/share/nvim/site/pack/' .. variant_name .. '/packer/start/*')

	return packer.startup(function(use)
		use("wbthomason/packer.nvim")
		for _, plugin in ipairs(plugins) do
			use(plugin)
		end
	end)
end

return M
