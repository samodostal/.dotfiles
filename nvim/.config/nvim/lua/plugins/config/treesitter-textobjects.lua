return function()
	local tt = safe_require 'nvim-treesitter.configs'
	if not tt then
		return
	end

	tt.setup {
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['ac'] = '@class.outer',
					['ic'] = '@class.inner',
				},
				selection_modes = {
					['@parameter.outer'] = 'v',
					['@function.outer'] = 'V',
					['@class.outer'] = '<c-v>',
				},
				include_surrounding_whitespace = true,
			},
		},
	}
end
