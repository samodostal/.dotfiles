local M = {}
local fmt = string.format

local term_wrapper = function(command, file)
	-- Run command accepts 2 params
	-- 1: Default terminal command, between quotes
	-- 2: Optional: a fmt argument with %
	-- Eg: term_wrapper('echo I am editing %s', vim.fn.expand("%"))
	vim.cmd("vnew")
	vim.cmd("vertical resize 70")
	vim.cmd("term " .. fmt(command, file))
	vim.cmd("silent! file CompileAndRun")
	vim.cmd("set nobuflisted")
	vim.cmd("setl nornu nonu nocul so=0 scl=no")
	vim.cmd("startinsert")
end

local commands = {
	cpp = "g++ -std=c++11 %s && ./a.out",
	javascript = "node %s",
}

M.compile_and_run = function()
	local filetype = vim.bo.filetype
	if commands[filetype] then
		term_wrapper(commands[filetype], vim.fn.expand("%"))
	else
		print(fmt('Filetype "%s" is not yet supported.', filetype))
	end
end

return M
