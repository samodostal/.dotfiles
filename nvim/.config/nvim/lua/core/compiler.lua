local M = {}

local term_wrapper = function(command, file)
	vim.cmd 'vnew'
	vim.cmd 'vertical resize 70'
	vim.cmd('term ' .. string.format(command, file))
	vim.cmd 'silent! file CompileAndRun'
	vim.cmd 'set nobuflisted'
	vim.cmd 'setl nornu nonu nocul so=0 scl=no'
	vim.cmd 'startinsert'
end

local commands = {
	c = 'gcc -std=c99 -pedantic -Wall -Wextra -o out %s && ./out',
	cpp = 'g++ -std=c++11 -O2 -Wall -include precompiled/main.h -o out %s && ./out',
	javascript = 'node %s',
	java = "cd src && find . -type f -name '*.class' -delete && javac gui/LoginScreen.java -Xlint:unchecked && java -cp . gui/LoginScreen",
	go = 'go run %s',
	python = 'python3 %',
	haskell = 'runhaskell %s',
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
		print(string.format('Filetype "%s" is not yet supported.', filetype))
	end
end

return M
