return function()
	local scrollbar = safe_require 'scrollbar'
	if not scrollbar then return end

	scrollbar.setup()
end
