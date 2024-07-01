local utils = require 'core.utils'

local map = require('core.scripts.keymap_helpers').map
local map_menu = require('core.scripts.keymap_helpers').map_menu

vim.g.mapleader = ' '

-- Menu maps (used less, do not require separate keymaps for now)

map_menu('Neovim management', '<leader>nn', {
	{ text = 'Check health', cmd = ':checkhealth' },
	{ text = 'Lazy', cmd = ':Lazy' },
	{ text = 'Mason', cmd = ':Mason' },
	{ text = 'LSP info', cmd = ':LspInfo' },
})

map_menu('Haskell tools', '<leader>hh', {
	{ text = 'Hoogle search', cmd = ':lua require("telescope").extensions.hoogle.hoogle()' },
	{ text = 'Hoogle signature', cmd = ':lua require("haskell-tools").hoogle.hoogle_signature()' },
})

-- Standard maps (used frequently)

map('n', '<C-e>', '<C-i>')

map('n', '<C-i>', '<C-u>')
map('n', '<C-d>', '<C-d>')
map('v', '<C-i>', '<C-u>')
map('v', '<C-d>', '<C-d>')

map('n', '<leader>', '<Nop>')
map('n', 'q:', '<Nop>')

map('n', '<leader>t', ':b#<CR>')
map('x', '<', '<gv')
map('x', '>', '>gv')

map('n', '<F18>', ':cprev<CR>')
map('n', '<F19>', ':cnext<CR>')
map('n', '<leader>co', ':copen<CR>')
map('n', '<leader>ce', ':cclose<CR>')

map('n', '<leader>cc', ':lua require("core.compiler").compile_and_run()<CR>')

map('n', '<leader>v', '"+p`[v`]=')

-- LSP
map('n', 'gd', ':lua require("telescope.builtin").lsp_definitions()<CR>')
map('n', 'gr', ':lua require("telescope.builtin").lsp_references()<CR>')
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
map('n', 'gy', ':lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>pd', ':lua vim.diagnostic.open_float()<CR>')
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')

-- Format
map('n', '<leader>fp', ':lua require("conform").format()<CR>')

-- Harpoon
map('n', '<leader>uf', ':lua require("harpoon.mark").add_file()<CR>:e<CR>') -- e to register bufferline
map('n', '<leader>uc', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
map('n', '<leader>uh', ':lua require("harpoon.ui").nav_file(1)<CR>')
map('n', '<leader>um', ':lua require("harpoon.ui").nav_file(2)<CR>')
map('n', '<leader>uw', ':lua require("harpoon.ui").nav_file(3)<CR>')
map('n', '<leader>uv', ':lua require("harpoon.ui").nav_file(4)<CR>')
map('n', '<leader>uz', ':lua require("harpoon.ui").nav_file(5)<CR>')

-- Telescope
if utils.is_in_git_workspace() then
	map('n', '<leader>ff', ':lua require("telescope.builtin").git_files({ show_untracked = true })<CR>')
else
	map('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<CR>')
end
map('n', '<leader>fr', ':lua require("telescope.builtin").live_grep()<CR>')
map('n', '<leader>fa', ':lua require("telescope.builtin").resume()<CR>')
map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>')
map('n', '<leader>fc', ':lua require("telescope").extensions.frecency.frecency()<CR>')
map('n', '<leader>fu', ':lua require("telescope").extensions.undo.undo()<CR>')
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
map('n', '<leader>b', ':lua require("nvim-tree.api").tree.toggle({ focus = false })<CR>')
map('n', '<leader>ft', ':NvimTreeFindFile<CR>')

-- Spread
map('n', '<leader>m', ':TSJToggle<CR>')

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

-- Aerial
map('n', '<leader>cs', ':AerialToggle<CR>')

-- Nvim Tmux Navigator
map('n', '<C-h>', ':lua require("nvim-tmux-navigation").NvimTmuxNavigateLeft()<CR>')
map('n', '<C-j>', ':lua require("nvim-tmux-navigation").NvimTmuxNavigateDown()<CR>')
map('n', '<C-k>', ':lua require("nvim-tmux-navigation").NvimTmuxNavigateUp()<CR>')
map('n', '<C-l>', ':lua require("nvim-tmux-navigation").NvimTmuxNavigateRight()<CR>')

-- Mistral AI
map('v', '<leader>ha', ':Gen<CR>')
map('n', '<leader>ha', ':Gen<CR>')
