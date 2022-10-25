return function()
	if vim.fn.executable 'nvr' == 1 then
		vim.env.GIT_EDITOR = "nvr --remote-tab-wait +'set bufhidden=delete'"
	end
end
