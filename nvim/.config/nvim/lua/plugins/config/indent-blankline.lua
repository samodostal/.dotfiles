return function()
	local indent_blankline = safe_require 'indent_blankline'
	if not indent_blankline then
		return
	end

	vim.opt.list = true
	-- vim.opt.listchars:append 'eol:↴'
	vim.opt.listchars:append 'eol:↲'

	indent_blankline.setup {
		show_end_of_line = true,
		space_char_blankline = ' ',
		show_current_context = true,
		char_highlight_list = {
			'IndentBlankline',
		},
	}
end
