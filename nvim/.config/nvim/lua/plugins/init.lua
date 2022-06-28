local utils = require 'core.utils'
local table_size = utils.table_size
local plugin_loaded = utils.plugin_loaded

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

  local packer = require 'packer'

  local package_root = vim.fn.stdpath("data") .. "/site/" .. variant_name .. "/"
  local compile_path = vim.fn.stdpath("data") .. "/compiled/packer_compiled_" .. variant_name .. ".lua"

  packer.init({
   package_root = package_root,
   compile_path = compile_path,
  })

  -- Add plugins to packpath / runtimepath manually [https://github.com/wbthomason/packer.nvim/issues/575]
  vim.opt.packpath:append(package_root .. "packer")

  packer.use("wbthomason/packer.nvim")
  for _, plugin in ipairs(plugins) do
    packer.use(plugin)

    -- Temporarily load plugin config manually, config in packer does not work with custom package_root
    local config = plugin.config
    if config then
      load_plugin_config(config)
    end
  end
end

function load_plugin_config(config)
  local config_fn = safe_require('plugins.config.' .. config)
  if config_fn then
    config_fn()
  end
end

return M
