-- local banned_buf_names = { 'NvimTree', 'aerial' }

-- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
-- 	callback = function() end,
-- })

vim.api.nvim_create_autocmd('BufWinEnter', {
	group = vim.api.nvim_create_augroup('help_window_right', {}),
	pattern = { '*.txt' },
	callback = function()
		if vim.o.filetype == 'help' then
			vim.cmd.wincmd 'L'
		end
	end,
})
