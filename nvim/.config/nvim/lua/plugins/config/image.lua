return function()
	local image = safe_require 'image'
	if not image then
		return
	end

	image.setup {
		render = {
			min_padding = 5,
			show_label = true,
			use_dither = true,
			foreground_color = true,
			background_color = true
		},
		events = {
			update_on_nvim_resize = true,
		},
	}
end
