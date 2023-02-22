return function()
	local bufferline = safe_require 'bufferline'
	local harpoon = safe_require 'harpoon'
	if not bufferline or not harpoon then
		return
	end

	bufferline.setup {
		options = {
			numbers = 'ordinal',
			diagnostics = 'nvim_lsp',
			indicator = { icon = ' ', style = 'none' },
			offsets = {
				{ filetype = 'NvimTree', text = 'File Explorer', separator = true },
				{ filetype = 'aerial', text = 'Symbols', separator = true },
			},
			close_icon = '',
			separator_style = { ' ', ' ' },
			custom_filter = function(buf_number)
				local marks = require('harpoon').get_mark_config().marks
				for _, mark in ipairs(marks) do
					if vim.fn.bufname(buf_number) == mark.filename then
						return true
					end
				end
				return false
			end,
			sort_by = function(buffer_a, buffer_b)
				local a = 1
				local b = 1

				local marks = require('harpoon').get_mark_config().marks
				for _, mark in ipairs(marks) do
					if vim.fn.bufname(buffer_a.id) == mark.filename then
						a = 0
						break
					elseif vim.fn.bufname(buffer_b.id) == mark.filename then
						b = 0
						break
					end
				end
				return a < b
			end,
		},
		highlights = {
			offset_separator = {
				fg = '#464646',
			},
		},
	}
end
