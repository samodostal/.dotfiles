return function()
	local aerial = safe_require 'aerial'
	if not aerial then
		return
	end

	aerial.setup {
		backends = { 'treesitter', 'lsp', 'markdown', 'man' },
		attach_mode = 'global',
		layout = {
			min_width = 30,
			placement = 'edge',
		},
		show_guides = true,
		highlight_on_hover = true,
		filter_kind = false,
		-- open_automatic = true,
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
