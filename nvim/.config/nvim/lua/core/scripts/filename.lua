local banned_buf_names = { 'NvimTree' }

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
	callback = function()
		local file_path = vim.fn.expand '%:~:.:h'
		local file_name = vim.fn.expand '%:t'

		if file_name == '' then
			return
		end

		for i in pairs(banned_buf_names) do
			if file_name:find(banned_buf_names[i]) then
				vim.api.nvim_win_set_option(0, 'winhl', 'Normal:Normal')
				return
			end
		end

		local winbar = file_path .. '/' .. file_name
		pcall(vim.api.nvim_set_option_value, 'winbar', ' %=' .. winbar .. '%= ', { scope = 'local' })
	end,
})
