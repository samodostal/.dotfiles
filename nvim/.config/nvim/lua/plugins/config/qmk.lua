return function()
	local qmk = safe_require 'qmk'
	if not qmk then
		return
	end

	qmk.setup {
		-- One MCU Dactyl Keyboard
		name = 'LAYOUT_dactyl',
		comment_preview = {
			keymap_overrides = {
				HERE_BE_A_LONG_KEY = 'Magic', -- replace any long key codes
			},
		},
		layout = {
			'x x x x x x _ _ _ _ _ _ _ x x x x x x',
			'x x x x x x _ _ _ _ _ _ _ x x x x x x',
			'x x x x x x _ _ _ _ _ _ _ x x x x x x',
			'x x x x x x _ _ _ _ _ _ _ x x x x x x',
			'_ _ x x _ x x x x _ x x x x _ x x _ _',
		},
	}
end
