return function()
	local haskell_tools = safe_require 'haskell-tools'
	if not haskell_tools then
		return
	end

	haskell_tools.setup()
end
