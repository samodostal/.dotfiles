local colors = require 'core.colors'

require('gruvbox').setup {
	transparent_mode = true,
	overrides = {
		IndentBlankline = { fg = '#262626' },
		IndentBlanklineContextChar = { fg = '#262626' },
		IndentBlanklineSpaceChar = { bg = 'none' },
		NormalFloat = { bg = 'none' },
		FloatBorder = { bg = 'none' },
		Pmenu = { bg = 'none' },
		WinBar = { bg = 'none' },
		WinBarNC = { bg = 'none' },
		WinSeparator = { fg = '#383838' },
		VertSplit = { bg = 'none', fg = '#464646' },
		CursorLine = { bg = '#202020' },
		CursorLineNr = { bg = '#202020' },
		NvimTreeRootFolder = { fg = colors.neutral_yellow },
		AerialLine = { bg = '#202020', bold = true },
		MiniMapNormal = { fg = '#808080', bg = 'none' },
		MiniMapSymbolView = { fg = '#555555' },
		MiniMapSymbolLine = { fg = '#707070' },

		MarkdownError = { bg = '#000000' },
		LuaParenError = { bg = '#000000' },

		FlashMatch = { fg = '#ffff00', bg = 'none' },
		FlashCurrent = { fg = '#ffA500', bg = 'none' },
		FlashLabel = { fg = '#00ffff', bg = 'none', bold = true },

		-- Custom statusbar highlights
		St_file_sep = { bg = colors.red },
		StatusLine = { bg = colors.red },
		StatusLineNC = { bg = colors.red },
		StatusDefault = { fg = colors.fg, bg = colors.bg },
		StatusVimNormal = { fg = colors.bg, bg = colors.accent },
		StatusVimInsert = { fg = colors.bg, bg = colors.neutral_blue },
		StatusVimVisual = { fg = colors.bg, bg = colors.func },
		StatusVimReplace = { fg = colors.bg, bg = colors.entity },
		StatusVimEnter = { fg = colors.bg, bg = colors.string },
		StatusVimMore = { fg = colors.bg, bg = colors.regexp },
		StatusVimSelect = { fg = colors.bg, bg = colors.markup },
		StatusVimCmd = { fg = colors.bg, bg = colors.keyword },
		StatusVimShell = { fg = colors.bg, bg = colors.special },
		StatusVimTerm = { fg = colors.bg, bg = colors.comment },
		StatusModified = { fg = colors.bg, bg = colors.constant },
		StatusLineNumber = { fg = colors.bg, bg = colors.operator },
		StatusColumnNumber = { fg = colors.bg, bg = colors.error },
		StatusFileInfo = { fg = colors.keyword, bg = colors.bg },
		StatusGitInfo = { fg = colors.bright_green, bg = colors.bg },
		StatusLSPProgress = { fg = colors.neutral_blue, bg = colors.bg },
		StatusLSPError = { fg = colors.error, bg = colors.bg },
		StatusLSPWarn = { fg = colors.accent, bg = colors.bg },
		StatusLSPInfo = { fg = colors.entity, bg = colors.bg },
		StatusLSPHint = { fg = colors.tag, bg = colors.bg },
		StatusLSPStatus = { fg = colors.tag, bg = colors.bg },
		StatusCwd = { fg = colors.keyword, bg = colors.bg },
		StatusCursor = { fg = colors.accent, bg = colors.bg },
	},
}

vim.cmd 'colorscheme gruvbox'

-- LSP

-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 	signs = true,
-- 	update_in_insert = true,
-- })

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = 'single',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = 'single',
})

vim.diagnostic.config {
	underline = true,
	signs = false,
	virtual_text = true,
	severity_sort = true,
	float = {
		header = '',
		source = true,
		focusable = true,
	},
}

-- require('lspconfig.ui.windows').default_options.border = 'rounded'
