local M = {}

function _G.safe_require(module, silent)
	silent = silent or false
	local ok, result = pcall(require, module)
	if not ok then
		if not silent then
			vim.notify(string.format('Could not safe_require: %s', module))
		end
		return ok
	end
	return result
end

function M.plugin_conf(name)
	return require(string.format('plugins.config.%s', name))
end

function M.table_size(t)
	local s = 0
	for _ in pairs(t) do
		s = s + 1
	end
	return s
end

return M
