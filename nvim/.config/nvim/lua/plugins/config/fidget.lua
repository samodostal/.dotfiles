return function()
	local fidget = safe_require 'fidget'
	if not fidget then
		return
	end

	fidget.setup {
		text = { spinner = 'dots' },
		window = { blend = 0 },
	}
end
