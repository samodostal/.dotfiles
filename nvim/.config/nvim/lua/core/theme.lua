local colorscheme = 'gruvbox-material'
-- local colorscheme = 'oxocarbon'

vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_ui_contrast = 'high'

local colors = require 'core.colors'

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
		vim.cmd 'highlight LspInlayHint guifg=#606060 guibg=none'
		vim.cmd 'highlight WinBarNC guifg=#505050'
		vim.cmd 'highlight Pmenu guibg=none'
		vim.cmd 'highlight NormalFloat guibg=none'
		vim.cmd 'highlight FloatBorder guibg=none'

		vim.cmd 'highlight NavicIconsModule guifg=#d65d0e'
		vim.cmd 'highlight NavicIconsNamespace guifg=#458588'
		vim.cmd 'highlight NavicIconsPackage guifg=#689d6a'
		vim.cmd 'highlight NavicIconsClass guifg=#d79921'
		vim.cmd 'highlight NavicIconsMethod guifg=#458588'
		vim.cmd 'highlight NavicIconsProperty guifg=#689d6a'
		vim.cmd 'highlight NavicIconsField guifg=#b16286'
		vim.cmd 'highlight NavicIconsConstructor guifg=#458588'
		vim.cmd 'highlight NavicIconsEnum guifg=#b16286'
		vim.cmd 'highlight NavicIconsInterface guifg=#98971a'
		vim.cmd 'highlight NavicIconsFunction guifg=#458588'
		vim.cmd 'highlight NavicIconsVariable guifg=#b16286'
		vim.cmd 'highlight NavicIconsConstant guifg=#d65d0e'
		vim.cmd 'highlight NavicIconsString guifg=#98971a'
		vim.cmd 'highlight NavicIconsNumber guifg=#d65d0e'
		vim.cmd 'highlight NavicIconsBoolean guifg=#d65d0e'
		vim.cmd 'highlight NavicIconsArray guifg=#d65d0e'
		vim.cmd 'highlight NavicIconsObject guifg=#d65d0e'
		vim.cmd 'highlight NavicIconsKey guifg=#689d6a'
		vim.cmd 'highlight NavicIconsNull guifg=#d65d0e'
		vim.cmd 'highlight NavicIconsEnumMember guifg=#d79921'
		vim.cmd 'highlight NavicIconsStruct guifg=#b16286'
		vim.cmd 'highlight NavicIconsEvent guifg=#d79921'
		vim.cmd 'highlight NavicIconsOperator guifg=#cc241d'
		vim.cmd 'highlight NavicIconsTypeParameter guifg=#cc241d'
		vim.cmd 'highlight NavicText guifg=#606060'
		vim.cmd 'highlight NavicSeparator guifg=#606060'

		vim.cmd('highlight StatusDefault guifg=' .. colors.fg .. ' guibg=' .. colors.bg)
		vim.cmd('highlight StatusVimNormal guifg=' .. colors.bg .. ' guibg=' .. colors.accent)
		vim.cmd('highlight StatusVimInsert guifg=' .. colors.bg .. ' guibg=' .. colors.neutral_blue)
		vim.cmd('highlight StatusVimVisual guifg=' .. colors.bg .. ' guibg=' .. colors.func)
		vim.cmd('highlight StatusVimReplace guifg=' .. colors.bg .. ' guibg=' .. colors.entity)
		vim.cmd('highlight StatusVimEnter guifg=' .. colors.bg .. ' guibg=' .. colors.string)
		vim.cmd('highlight StatusVimMore guifg=' .. colors.bg .. ' guibg=' .. colors.regexp)
		vim.cmd('highlight StatusVimSelect guifg=' .. colors.bg .. ' guibg=' .. colors.markup)
		vim.cmd('highlight StatusVimCmd guifg=' .. colors.bg .. ' guibg=' .. colors.keyword)
		vim.cmd('highlight StatusVimShell guifg=' .. colors.bg .. ' guibg=' .. colors.special)
		vim.cmd('highlight StatusVimTerm guifg=' .. colors.bg .. ' guibg=' .. colors.comment)
		vim.cmd('highlight StatusModified guifg=' .. colors.bg .. ' guibg=' .. colors.constant)
		vim.cmd('highlight StatusLineNumber guifg=' .. colors.bg .. ' guibg=' .. colors.operator)
		vim.cmd('highlight StatusColumnNumber guifg=' .. colors.bg .. ' guibg=' .. colors.error)
		vim.cmd('highlight StatusFileInfo guifg=' .. colors.keyword .. ' guibg=' .. colors.bg)
		vim.cmd('highlight StatusGitInfo guifg=' .. colors.bright_green .. ' guibg=' .. colors.bg)
		vim.cmd('highlight StatusLSPProgress guifg=' .. colors.neutral_blue .. ' guibg=' .. colors.bg)
		vim.cmd('highlight StatusLSPError guifg=' .. colors.error .. ' guibg=' .. colors.bg)
		vim.cmd('highlight StatusLSPWarn guifg=' .. colors.accent .. ' guibg=' .. colors.bg)
		vim.cmd('highlight StatusLSPInfo guifg=' .. colors.entity .. ' guibg=' .. colors.bg)
		vim.cmd('highlight StatusLSPHin guifg=' .. colors.tag .. ' guibg=' .. colors.bg)
		vim.cmd('highlight StatusLSPStatus guifg=' .. colors.tag .. ' guibg=' .. colors.bg)
		vim.cmd('highlight StatusCwd guifg=' .. colors.keyword .. ' guibg=' .. colors.bg)
		vim.cmd('highlight StatusCursor guifg=' .. colors.accent .. ' guibg=' .. colors.bg)
	end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank { timeout = 150 }
	end,
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
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
