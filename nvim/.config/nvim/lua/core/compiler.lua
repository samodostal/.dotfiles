local M = {}
local fmt = string.format

local term_wrapper = function(command, file)
	vim.cmd 'vnew'
	vim.cmd 'vertical resize 70'
	vim.cmd('term ' .. fmt(command, file))
	vim.cmd 'silent! file CompileAndRun'
	vim.cmd 'set nobuflisted'
	vim.cmd 'setl nornu nonu nocul so=0 scl=no'
	vim.cmd 'startinsert'
end

local commands = {
	cpp = 'g++ -g -std=c++17 %s && ./a.out',
	javascript = 'node %s',
	java = "cd src && find . -type f -name '*.class' -delete && javac gui/LoginScreen.java -Xlint:unchecked && java -cp . gui/LoginScreen",
	go = 'go run %s',
	python = 'python3 %',
}

M.compile_and_run = function()
	local filetype = vim.bo.filetype
	if commands[filetype] then
		if filetype == 'python' then
			vim.cmd('!' .. commands[filetype])
		else
			term_wrapper(commands[filetype], vim.fn.expand '%')
		end
	else
		print(fmt('Filetype "%s" is not yet supported.', filetype))
	end
end

return M
