local colorscheme = 'gruvbox'
-- local colorscheme = 'enfocado'

vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = false

pcall(function()
  vim.cmd('colorscheme ' .. colorscheme)
end)
