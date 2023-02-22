return function()
	local barbecue = require 'barbecue'
	if not barbecue then
		return
	end

	barbecue.setup {
		show_dirname = false,
		show_basename = false,
	}
end
