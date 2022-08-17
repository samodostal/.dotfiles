return function()
	local image = safe_require 'image'
	if not image then
		return
	end

	image.setup {
		min_padding = 5,
		show_label = true,
		render_using_dither = true,
	}
end
