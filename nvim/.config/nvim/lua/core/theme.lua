local colorscheme = 'gruvbox-material'

vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_ui_contrast = 'high'

vim.api.nvim_create_autocmd('ColorScheme', {
	callback = function()
		vim.cmd 'highlight CursorLineNr guifg=#d79921'
		vim.cmd 'highlight CursorLine guibg=none'
		vim.cmd 'highlight VirtualTextError guifg=#db4b4b'
		vim.cmd 'highlight VirtualTextWarning guifg=#e0af68'
		vim.cmd 'highlight VirtualTextInfo guifg=#0db9d7'
		vim.cmd 'highlight VirtualTextHint guifg=#10B981'
	end,
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = false,
	update_in_insert = true,
})

pcall(function()
	vim.cmd('colorscheme ' .. colorscheme)
end)
