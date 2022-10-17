return function()
	local yanky = safe_require 'yanky'
	if not yanky then
		return
	end

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
