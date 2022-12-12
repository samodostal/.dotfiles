local banned_buf_names = { 'NvimTree', 'aerial' }

local setup_navic = function()
	local file_name = vim.fn.expand '%:t'

	if file_name == '' then
		return
	end

	for i in pairs(banned_buf_names) do
		if file_name:find(banned_buf_names[i]) then
			return
		end
	end

	vim.opt_local.winbar = "   %{%v:lua.require'nvim-navic'.get_location()%}"
end

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
	callback = function()
		setup_navic()
	end,
})
