return function()
	local mason = safe_require 'mason'
	if not mason then
		return
	end

	mason.setup()
end
