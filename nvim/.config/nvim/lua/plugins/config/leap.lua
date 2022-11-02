return function()
	local leap = safe_require 'leap'
	if not leap then
		return
	end

	leap.setup {}
end
