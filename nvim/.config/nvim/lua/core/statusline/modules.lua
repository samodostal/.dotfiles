local fn = vim.fn

local modes = {
	['n'] = { 'NORMAL', 'StatusVimNormal' },
	['niI'] = { 'NORMAL i', 'StatusVimNormal' },
	['niR'] = { 'NORMAL r', 'StatusVimNormal' },
	['niV'] = { 'NORMAL v', 'StatusVimNormal' },
	['no'] = { 'N-PENDING', 'StatusVimNormal' },
	['i'] = { 'INSERT', 'StatusVimInsert' },
	['ic'] = { 'INSERT', 'StatusVimInsert' },
	['ix'] = { 'INSERT completion', 'StatusVimInsert' },
	['t'] = { 'TERMINAL', 'StatusVimTerm' },
	['nt'] = { 'NTERMINAL', 'StatusVimTerm' },
	['v'] = { 'VISUAL', 'StatusVimVisual' },
	['V'] = { 'V-LINE', 'StatusVimVisual' },
	[''] = { 'V-BLOCK', 'StatusVimVisual' },
	['R'] = { 'REPLACE', 'StatusVimReplace' },
	['Rv'] = { 'V-REPLACE', 'StatusVimReplace' },
	['s'] = { 'SELECT', 'StatusVimSelect' },
	['S'] = { 'S-LINE', 'StatusVimSelect' },
	[''] = { 'S-BLOCK', 'StatusVimSelect' },
	['c'] = { 'COMMAND', 'StatusVimCmd' },
	['cv'] = { 'COMMAND', 'StatusVimCmd' },
	['ce'] = { 'COMMAND', 'StatusVimCmd' },
	['r'] = { 'PROMPT', 'StatusModified' },
	['rm'] = { 'MORE', 'StatusModified' },
	['r?'] = { 'CONFIRM', 'StatusModified' },
	['!'] = { 'SHELL', 'StatusVimTerm' },
}

local M = {}

M.mode = function()
	local m = vim.api.nvim_get_mode().mode
	local current_mode = '%#' .. modes[m][2] .. '#' .. '  ' .. modes[m][1] .. ' '
	return current_mode .. '%#ST_EmptySpace#'
end

M.fileInfo = function()
	local icon = ' 󰈙 '
	local filename = (fn.expand '%' == '' and 'Empty ') or fn.expand '%:t'

	if filename ~= 'Empty ' then
		local devicons_present, devicons = pcall(require, 'nvim-web-devicons')

		if devicons_present then
			local ft_icon = devicons.get_icon(filename)
			icon = (ft_icon ~= nil and ' ' .. ft_icon) or ''
		end

		filename = ' ' .. filename .. ' '
	end

	return '%#StatusFileInfo#' .. icon .. filename .. '%#St_file_sep#'
end

M.git = function()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ''
	end

	local git_status = vim.b.gitsigns_status_dict

	local added = (git_status.added and git_status.added ~= 0) and ('  ' .. git_status.added) or ''
	local changed = (git_status.changed and git_status.changed ~= 0) and ('  ' .. git_status.changed) or ''
	local removed = (git_status.removed and git_status.removed ~= 0) and ('  ' .. git_status.removed) or ''
	local branch_name = '   ' .. git_status.head .. ' '

	return '%#StatusGitInfo#' .. branch_name .. added .. changed .. removed
end

M.LSP_Diagnostics = function()
	if not rawget(vim, 'lsp') then
		return ''
	end

	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

	local s_errors = (errors and errors > 0) and ('%#StatusLSPError#' .. ' ' .. errors .. ' ') or ''
	local s_warnings = (warnings and warnings > 0) and ('%#StatusLSPWarn#' .. '  ' .. warnings .. ' ') or ''
	local s_hints = (hints and hints > 0) and ('%#StatusLSPHint#' .. '󰛩 ' .. hints .. ' ') or ''
	local s_info = (info and info > 0) and ('%#StatusLSPInfo#' .. '󰋼 ' .. info .. ' ') or ''

	return s_errors .. s_warnings .. s_hints .. s_info
end

M.copilot_status = function()
	local is_copilot_attached = false

	for _, client in ipairs(vim.lsp.get_clients()) do
		if client.attached_buffers[vim.api.nvim_get_current_buf()] then
			if client.name == 'copilot' then
				is_copilot_attached = true
				break
			end
		end
	end

	return ('%#StatusLSPStatus#' .. '< ' .. (is_copilot_attached and '' or '') .. ' /> ')
end

M.lsp_status = function()
	local client_names = ''

	if rawget(vim, 'lsp') then
		for _, client in ipairs(vim.lsp.get_clients()) do
			if client.attached_buffers[vim.api.nvim_get_current_buf()] then
				if client.name == 'copilot' then
					goto continue
				end

				if client_names == '' then
					client_names = client.name
				else
					client_names = client_names .. ', ' .. client.name
				end
				::continue::
			end
		end
	end

	return ('%#StatusLSPStatus#' .. '<  LSP - ' .. client_names .. '/> ')
end

M.linters_status = function()
	local lint = safe_require 'lint'
	if not lint then
		return
	end

	local client_names = ''

	for _, client in ipairs(lint._resolve_linter_by_ft(vim.bo.filetype)) do
		if client_names == '' then
			client_names = client
		else
			client_names = client_names .. ', ' .. client
		end
	end

	return ('%#StatusLSPStatus#' .. '<󰨮 Lint - ' .. client_names .. '/> ')
end

M.formatters_status = function()
	local conform = safe_require 'conform'
	if not conform then
		return
	end

	local client_names = ''

	for _, client in ipairs(conform.list_formatters_for_buffer(0)) do
		if client_names == '' then
			client_names = client
		else
			client_names = client_names .. ', ' .. client
		end
	end

	return ('%#StatusLSPStatus#' .. '<󰸱 Format - ' .. client_names .. '/> ')
end

M.cwd = function()
	local dir_icon = '%#StatusCwd#' .. ' 󰉋 '
	local dir_name = '%#StatusCwd#' .. fn.fnamemodify(fn.getcwd(), ':t') .. ' '
	return (vim.o.columns > 85 and (dir_icon .. dir_name)) or ''
end

M.cursor_position = function()
	local left_sep = '%#StatusCursor#' .. ' '

	local position = fn.getpos '.'
	local current_line = position[2]

	return left_sep .. '%#StatusCursor# ' .. current_line
end

return M
