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
  end,
})

pcall(function()
  vim.cmd('colorscheme ' .. colorscheme)
end)
