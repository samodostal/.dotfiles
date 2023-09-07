local symbols_table_because_dot_function_doesnt_work = {
	'⠀',
	'⠁',
	'⠈',
	'⠉',
	'⠂',
	'⠃',
	'⠊',
	'⠋',
	'⠐',
	'⠑',
	'⠘',
	'⠙',
	'⠒',
	'⠓',
	'⠚',
	'⠛',
	'⠄',
	'⠅',
	'⠌',
	'⠍',
	'⠆',
	'⠇',
	'⠎',
	'⠏',
	'⠔',
	'⠕',
	'⠜',
	'⠝',
	'⠖',
	'⠗',
	'⠞',
	'⠟',
	'⠠',
	'⠡',
	'⠨',
	'⠩',
	'⠢',
	'⠣',
	'⠪',
	'⠫',
	'⠰',
	'⠱',
	'⠸',
	'⠹',
	'⠲',
	'⠳',
	'⠺',
	'⠻',
	'⠤',
	'⠥',
	'⠬',
	'⠭',
	'⠦',
	'⠧',
	'⠮',
	'⠯',
	'⠴',
	'⠵',
	'⠼',
	'⠽',
	'⠶',
	'⠷',
	'⠾',
	'⠿',
	'⡀',
	'⡁',
	'⡈',
	'⡉',
	'⡂',
	'⡃',
	'⡊',
	'⡋',
	'⡐',
	'⡑',
	'⡘',
	'⡙',
	'⡒',
	'⡓',
	'⡚',
	'⡛',
	'⡄',
	'⡅',
	'⡌',
	'⡍',
	'⡆',
	'⡇',
	'⡎',
	'⡏',
	'⡔',
	'⡕',
	'⡜',
	'⡝',
	'⡖',
	'⡗',
	'⡞',
	'⡟',
	'⡠',
	'⡡',
	'⡨',
	'⡩',
	'⡢',
	'⡣',
	'⡪',
	'⡫',
	'⡰',
	'⡱',
	'⡸',
	'⡹',
	'⡲',
	'⡳',
	'⡺',
	'⡻',
	'⡤',
	'⡥',
	'⡬',
	'⡭',
	'⡦',
	'⡧',
	'⡮',
	'⡯',
	'⡴',
	'⡵',
	'⡼',
	'⡽',
	'⡶',
	'⡷',
	'⡾',
	'⡿',
	'⢀',
	'⢁',
	'⢈',
	'⢉',
	'⢂',
	'⢃',
	'⢊',
	'⢋',
	'⢐',
	'⢑',
	'⢘',
	'⢙',
	'⢒',
	'⢓',
	'⢚',
	'⢛',
	'⢄',
	'⢅',
	'⢌',
	'⢍',
	'⢆',
	'⢇',
	'⢎',
	'⢏',
	'⢔',
	'⢕',
	'⢜',
	'⢝',
	'⢖',
	'⢗',
	'⢞',
	'⢟',
	'⢠',
	'⢡',
	'⢨',
	'⢩',
	'⢢',
	'⢣',
	'⢪',
	'⢫',
	'⢰',
	'⢱',
	'⢸',
	'⢹',
	'⢲',
	'⢳',
	'⢺',
	'⢻',
	'⢤',
	'⢥',
	'⢬',
	'⢭',
	'⢦',
	'⢧',
	'⢮',
	'⢯',
	'⢴',
	'⢵',
	'⢼',
	'⢽',
	'⢶',
	'⢷',
	'⢾',
	'⢿',
	'⣀',
	'⣁',
	'⣈',
	'⣉',
	'⣂',
	'⣃',
	'⣊',
	'⣋',
	'⣐',
	'⣑',
	'⣘',
	'⣙',
	'⣒',
	'⣓',
	'⣚',
	'⣛',
	'⣄',
	'⣅',
	'⣌',
	'⣍',
	'⣆',
	'⣇',
	'⣎',
	'⣏',
	'⣔',
	'⣕',
	'⣜',
	'⣝',
	'⣖',
	'⣗',
	'⣞',
	'⣟',
	'⣠',
	'⣡',
	'⣨',
	'⣩',
	'⣢',
	'⣣',
	'⣪',
	'⣫',
	'⣰',
	'⣱',
	'⣸',
	'⣹',
	'⣲',
	'⣳',
	'⣺',
	'⣻',
	'⣤',
	'⣥',
	'⣬',
	'⣭',
	'⣦',
	'⣧',
	'⣮',
	'⣯',
	'⣴',
	'⣵',
	'⣼',
	'⣽',
	'⣶',
	'⣷',
	'⣾',
	'⣿',
	resolution = { row = 4, col = 2 },
}

return function()
	local minimap = safe_require 'mini.map'
	if not minimap then
		return
	end

	minimap.setup {
		integrations = {
			minimap.gen_integration.builtin_search(),
			minimap.gen_integration.diagnostic {
				error = 'DiagnosticFloatingError',
				warn = 'DiagnosticFloatingWarn',
				info = 'DiagnosticFloatingInfo',
				hint = 'DiagnosticFloatingHint',
			},
		},
		symbols = {
			encode = symbols_table_because_dot_function_doesnt_work,
			scroll_view = ' ',
			scroll_line = '',
		},
		window = {
			winblend = 0,
			show_integration_count = false,
		},
	}
end