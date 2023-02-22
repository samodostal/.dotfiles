local banned_buf_names = { 'NvimTree', 'aerial' }

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
	callback = function() end,
})
