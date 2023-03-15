return function(filename, line_number_unparsed)
	local line_number = tonumber(line_number_unparsed) or 1

	vim.api.nvim_win_close(0, true)
	vim.api.nvim_command('edit +' .. line_number.. " " .. filename)
end
