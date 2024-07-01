return function()
	local image = safe_require 'image'
	local clipboard_image = safe_require 'clipboard-image'

	if not image or not clipboard_image then
		return
	end

	clipboard_image.setup {
		norg = {
			img_dir = { '%:p:h', 'assets', 'img' },
			affix = '.image assets/%s',
		},
	}

	image.setup {
		backend = 'kitty',
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { 'markdown', 'vimwiki' },
			},
			neorg = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { 'norg' },
			},
		},
		max_width = nil,
		max_height = nil,
		max_width_window_percentage = 50,
		max_height_window_percentage = 40,
		window_overlap_clear_enabled = true,
		window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
		editor_only_render_when_focused = true,
		tmux_show_only_in_active_window = true,
		hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp' },
	}
end
