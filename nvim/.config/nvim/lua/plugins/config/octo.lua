return function()
	local octo = safe_require 'octo'
	if not octo then
		return
	end

	octo.setup()
end
