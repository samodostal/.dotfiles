return function()
	local trevj = safe_require 'trevj'
	if not trevj then
		return
	end

	trevj.setup {}
end
