local map = function(mode, key, cmd, opts)
	vim.api.nvim_set_keymap(mode, key, cmd, opts or { noremap = true, silent = true })
end

vim.g.mapleader = ' '

map('n', '<C-o>', '<C-o>zz')
map('n', '<C-e>', '<C-i>zz')
map('n', '<C-i>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')

map('n', '<leader>', '<Nop>')
map('n', 'q:', '<Nop>')

map('n', '<leader>t', ':b#<CR>')
map('x', '<', '<gv')
map('x', '>', '>gv')

map('n', '<leader>cc', ':lua require("core.compiler").compile_and_run()<CR>')

-- Packer
map('n', '<leader>pc', ':PackerCompile<CR>')
map('n', '<leader>ps', ':PackerSync<CR>')

-- LSP
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
map('n', 'gy', ':lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>fp', ':lua vim.lsp.buf.format({ async = true })<CR>')
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>pd', ':lua vim.diagnostic.open_float()<CR>')
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
map('n', '<leader>ff', ':lua require("telescope.builtin").git_files({ show_untracked = true })<CR>')
map('n', '<leader>fr', ':lua require("telescope.builtin").live_grep()<CR>')
map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>')
map('n', '<leader>fy', ':Telescope yank_history<CR>')

-- DAP
map('n', '<leader>ds', '<cmd>lua require("dapui").open()<CR><cmd>NvimTreeClose<CR>')
map(
	'n',
	'<leader>de',
	'<cmd>lua require("dapui").close()<CR><cmd>lua require("dap").clear_breakpoints()<CR><cmd>NvimTreeOpen<CR>'
)

map('n', '<leader>dd', ':lua require("dap").continue()<CR>')
map('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>')
map('n', '<leader>dl', ':lua require("dap").step_over()<CR>')
map('n', '<leader>dj', ':lua require("dap").step_into()<CR>')
map('n', '<leader>dk', ':lua require("dap").step_out()<CR>')
map('n', '<leader>dh', ':lua require("dap").step_out()<CR>')
map('n', '<leader>dc', ':lua require("dap").run_to_cursor()<CR>')

-- Tree
map('n', '<leader>b', ':lua require("nvim-tree").toggle(false, true)<CR>')
map('n', '<leader>ft', ':NvimTreeFindFile<CR>')

-- Copilot client
map('i', '<C-c>', '<cmd>lua require("copilot-client").suggest()<CR>')
map('n', '<C-c>', '<cmd>lua require("copilot-client").suggest()<CR>')

-- Spread
map('n', '<leader>j', ':lua require("spread").out()<CR>')
map('n', '<leader>k', ':lua require("spread").combine()<CR>')

-- Cmp
map('i', '<C-x>', '<cmd>lua require("cmp").complete()<CR>')
map('n', '<C-)', '<Plug>(YankyCycleBackward)')

-- Yanky
map('n', 'p', '<Plug>(YankyPutAfter)')
map('n', 'P', '<Plug>(YankyPutBefore)')
map('n', 'gp', '<Plug>(YankyGPutAfter)')
map('n', 'gP', '<Plug>(YankyGPutBefore)')
map('n', '<C-f>', '<Plug>(YankyCycleForward)')
map('n', '<C-g>', '<Plug>(YankyCycleBackward)')

-- Lazygit
map('n', '<leader>gs', ':LazyGit<CR>')
map('n', '<leader>gc', ':LazyGitFilter<CR>')
map('n', '<leader>gh', ':LazyGitFilterCurrentFile<CR>')
