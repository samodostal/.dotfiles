local colorscheme = 'gruvbox-material'
-- local colorscheme = 'oxocarbon'

vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_ui_contrast = 'high'

vim.g.oxocarbon_lua_transparent = true
vim.g.oxocarbon_lua_alternative_telescope = true
vim.g.oxocarbon_lua_keep_terminal = true

vim.api.nvim_create_autocmd('ColorScheme', {
	callback = function()
		vim.cmd 'highlight CursorLineNr guifg=#d79921'
		vim.cmd 'highlight CursorLine guibg=#303030'
		vim.cmd 'highlight NvimTreeCursorLine guibg=#303030'
		vim.cmd 'highlight VirtualTextError guifg=#db4b4b'
		vim.cmd 'highlight VirtualTextWarning guifg=#e0af68'
		vim.cmd 'highlight VirtualTextInfo guifg=#0db9d7'
		vim.cmd 'highlight VirtualTextHint guifg=#10B981'
		vim.cmd 'highlight TreesitterContext guibg=#262626'
		vim.cmd 'highlight IndentBlankline guifg=#363636 gui=nocombine'
		vim.cmd 'highlight NonText guifg=#464646 gui=nocombine'
		vim.cmd 'highlight QuickScopePrimary guifg=#afff5f gui=underline ctermfg=155 cterm=underline'
		vim.cmd 'highlight QuickScopeSecondary guifg=#5fffff gui=underline ctermfg=155 cterm=underline'
		vim.cmd 'highlight LspInlayHint guifg=#606060 guibg=none'
		vim.cmd 'highlight WinBar guifg=#808080 cterm=none gui=none'
		vim.cmd 'highlight WinBarNC guifg=#464646'
		vim.cmd 'highlight Pmenu guibg=none'
		vim.cmd 'highlight NormalFloat guibg=none'
		vim.cmd 'highlight FloatBorder guibg=none'
	end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank { timeout = 150 }
	end,
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = false,
	update_in_insert = true,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = 'single',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = 'single',
})

pcall(function()
	vim.cmd('colorscheme ' .. colorscheme)
end)
