local function i_hate_how_highlights_work_in_bufferline_why_wont_they_just_expose_highlight_groups()
	return {
		offset_separator = {
			fg = '#464646',
		},
		fill = {
			fg = '#dddddd',
		},
		background = {
			fg = '#dddddd',
		},
		tab = {
			fg = '#dddddd',
		},
		tab_selected = {},
		tab_close = {
			fg = '#dddddd',
		},
		close_button = {
			fg = '#dddddd',
		},
		close_button_visible = {
			fg = '#dddddd',
		},
		close_button_selected = {
			fg = '#dddddd',
		},
		buffer_visible = {
			fg = '#dddddd',
		},
		numbers = {
			fg = '#dddddd',
		},
		numbers_visible = {
			fg = '#dddddd',
		},
		numbers_selected = {
			fg = '#dddddd',
			bold = true,
			italic = true,
		},
		diagnostic = {
			fg = '#dddddd',
		},
		diagnostic_visible = {
			fg = '#dddddd',
		},
		diagnostic_selected = {
			fg = '#dddddd',
			bold = true,
			italic = true,
		},
		hint = {
			fg = '#dddddd',
			sp = '#dddddd',
		},
		hint_visible = {
			fg = '#dddddd',
		},
		hint_selected = {
			fg = '#dddddd',
			sp = '#dddddd',
			bold = true,
			italic = true,
		},
		hint_diagnostic = {
			fg = '#dddddd',
			sp = '#dddddd',
		},
		hint_diagnostic_visible = {
			fg = '#dddddd',
		},
		hint_diagnostic_selected = {
			fg = '#dddddd',
			sp = '#dddddd',
			bold = true,
			italic = true,
		},
		info = {
			fg = '#dddddd',
			sp = '#dddddd',
		},
		info_visible = {
			fg = '#dddddd',
		},
		info_selected = {
			fg = '#dddddd',
			sp = '#dddddd',
			bold = true,
			italic = true,
		},
		info_diagnostic = {
			fg = '#dddddd',
			sp = '#dddddd',
		},
		info_diagnostic_visible = {
			fg = '#dddddd',
		},
		info_diagnostic_selected = {
			fg = '#dddddd',
			sp = '#dddddd',
			bold = true,
			italic = true,
		},
		warning = {
			fg = '#dddddd',
			sp = '#dddddd',
		},
		warning_visible = {
			fg = '#dddddd',
		},
		warning_selected = {
			fg = '#dddddd',
			sp = '#dddddd',
			bold = true,
			italic = true,
		},
		warning_diagnostic = {
			fg = '#dddddd',
			sp = '#dddddd',
		},
		warning_diagnostic_visible = {
			fg = '#dddddd',
		},
		error = {
			fg = '#dddddd',
			sp = '#dddddd',
		},
		error_visible = {
			fg = '#dddddd',
		},
		error_selected = {
			fg = '#dddddd',
			sp = '#dddddd',
			bold = true,
			italic = true,
		},
		error_diagnostic = {
			fg = '#dddddd',
			sp = '#dddddd',
		},
		error_diagnostic_visible = {
			fg = '#dddddd',
		},
		error_diagnostic_selected = {
			fg = '#dddddd',
			sp = '#dddddd',
			bold = true,
			italic = true,
		},
		modified = {
			fg = '#dddddd',
		},
		modified_visible = {
			fg = '#dddddd',
		},
		modified_selected = {
			fg = '#dddddd',
		},
		duplicate_selected = {
			fg = '#dddddd',
			italic = true,
		},
		duplicate_visible = {
			fg = '#dddddd',
			italic = true,
		},
		duplicate = {
			fg = '#dddddd',
			italic = true,
		},
		separator_selected = {
			fg = '#dddddd',
		},
		separator_visible = {
			fg = '#dddddd',
		},
		separator = {
			fg = '#dddddd',
		},
		indicator_selected = {
			fg = '#dddddd',
		},
		pick_selected = {
			fg = '#dddddd',
			bold = true,
			italic = true,
		},
		pick_visible = {
			fg = '#dddddd',
			bold = true,
			italic = true,
		},
		pick = {
			fg = '#dddddd',
			bold = true,
			italic = true,
		},
	}
end

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
		highlights = i_hate_how_highlights_work_in_bufferline_why_wont_they_just_expose_highlight_groups(),
	}
end
