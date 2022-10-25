return function()
	local yanky = safe_require 'yanky'
	if not yanky then
		return
	end

	vim.g.clipboard = {
		name = 'xsel_override',
		copy = {
			['+'] = 'xsel --input --clipboard',
			['*'] = 'xsel --input --primary',
		},
		paste = {
			['+'] = 'xsel --output --clipboard',
			['*'] = 'xsel --output --primary',
		},
		cache_enabled = 1,
	}

	yanky.setup {
		preserve_cursor_position = {
			enabled = true,
		},
		highlight = {
			on_put = true,
			on_yank = true,
			timer = 100,
		},
	}
end
