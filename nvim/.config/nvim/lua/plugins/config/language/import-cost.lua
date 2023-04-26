return function()
	local import_cost = safe_require 'import-cost'
	if not import_cost then
		return
	end

	import_cost.setup {
		format = {
			virtual_text = ' %s (gzipped: %s)',
		},
	}
end
