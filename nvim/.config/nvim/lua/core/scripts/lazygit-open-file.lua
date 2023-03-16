return function(filename, line_number)
	line_number = tonumber(line_number) or 1

	-- local utils = require 'core.utils'
	-- utils.log(filename .. ':' .. line_number)

	vim.api.nvim_win_close(0, true)
	vim.api.nvim_command('edit +' .. line_number.. " " .. filename)
end
