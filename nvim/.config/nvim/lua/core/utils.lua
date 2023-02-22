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

function M.merge_tables(...)
	local result = {}

	for _, t in ipairs { ... } do
		for _, v in ipairs(t) do
			table.insert(result, v)
		end
	end

	return result
end

function M.is_in_git_workspace()
	vim.fn.system 'git rev-parse --is-inside-work-tree'
	return vim.v.shell_error == 0
end

function M.log(message)
	local log_file_path = '/home/samodostal/test.log'
	local log_file = io.open(log_file_path, 'a')
	io.output(log_file)
	io.write(message .. '\n')
	io.close(log_file)
end

return M
