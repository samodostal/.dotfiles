return function()
	local image = safe_require 'image'
	if not image then
		return
	end

	image.setup {}
end
