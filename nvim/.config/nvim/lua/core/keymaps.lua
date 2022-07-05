local map = function(mode, key, cmd, opts)
	vim.api.nvim_set_keymap(mode, key, cmd, opts or { noremap = true, silent = true })
end

vim.g.mapleader = ' '

map('n', '<leader>', '<Nop>')
map('n', 'q:', '<Nop>')

map('n', '<leader>t', ':b#<CR>')

-- LSP
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
map('n', 'gy', ':lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>fp', ':lua vim.lsp.buf.format({ async = true })<CR>')
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')

-- Harpoon
map('n', '<leader>af', ':lua require("harpoon.mark").add_file()<CR>')
map('n', '<leader>ac', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
map('n', '<leader>ah', ':lua require("harpoon.ui").nav_file(1)<CR>')
map('n', '<leader>am', ':lua require("harpoon.ui").nav_file(2)<CR>')
map('n', '<leader>aw', ':lua require("harpoon.ui").nav_file(3)<CR>')
map('n', '<leader>av', ':lua require("harpoon.ui").nav_file(4)<CR>')
map('n', '<leader>az', ':lua require("harpoon.ui").nav_file(5)<CR>')

-- Telescope
map('n', '<leader>ff', ':lua require("telescope.builtin").git_files()<CR>')
map('n', '<leader>fr', ':lua require("telescope.builtin").live_grep()<CR>')
