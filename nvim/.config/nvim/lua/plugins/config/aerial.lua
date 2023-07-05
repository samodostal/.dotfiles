return function()
	local aerial = safe_require 'aerial'
	if not aerial then
		return
	end

	aerial.setup {
		backends = {
			'lsp',
			'treesitter',
			'markdown',
			'man',
		},
		attach_mode = 'global',
		layout = {
			min_width = 25,
			placement = 'edge',
			win_opts = {
				winbar = "%=Symbols%="
			}
		},
		show_guides = true,
		highlight_on_hover = true,
		ignore = {
			unlisted = true,
		},
		guides = {
			mid_item = '├ ',
			last_item = '└ ',
			nested_top = '│ ',
			whitespace = '  ',
		},
	}
end
