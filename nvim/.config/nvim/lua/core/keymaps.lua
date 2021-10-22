local utils = require 'core.utils'
local map = utils.keymap.map

vim.g.mapleader = ' '
map('n', '<leader>', '<Nop>')
map('x', '<leader>', '<Nop>')

map('n', 'Q', '<Nop>')
map('n', 'q:', '<Nop>')
map('n', 'Y', 'y$')
map('n', 'x', '"_x')
map('n', 'X', '"_X')
map('n', '<leader>pc', '<cmd>lua require"core.compiler".compile_and_run()<CR>')
-- map('n', '<leader>fp', '<cmd>let @*=fnamemodify(expand("%"), ":~:.")<CR>') -- Copy relative filepath

vim.cmd [[command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor]]
vim.cmd [[command! PackerDelete silent! !rm  -rf ~/.local/share/nvim/site <CR>]]

map('n', '<leader>y', '"*y');
map('n', '<leader>p', '"*p');
map('v', '<leader>y', '"*y');
map('v', '<leader>p', '"*p');

-- map('n', '<C-c>', '"*y')
-- map('v', '<C-c>', '"*y')
-- map('n', '<C-p>', '"*p')
-- map('i', '<C-p>', '"*p')

map('n', '<leader>t', ':b#<CR>')

map('n', '<leader>j', ':cnext<CR>')
map('n', '<leader>k', ':cprev<CR>')

map('n', '<C-h>', '<cmd>wincmd l<CR>')
map('n', '<C-j>', '<cmd>wincmd j<CR>')
map('n', '<C-k>', '<cmd>wincmd k<CR>')
map('n', '<C-l>', '<cmd>wincmd h<CR>')
map('n', '<Up>', '<cmd>wincmd -<CR>')
map('n', '<Down>', '<cmd>wincmd +<CR>')
map('n', '<Left>', '<cmd>wincmd <<CR>')
map('n', '<Right>', '<cmd>wincmd ><CR>')

map('x', '<', '<gv')
map('x', '>', '>gv')
map('x', 'K', ":move '<-2<CR>gv-gv")
map('x', 'J', ":move '>+1<CR>gv-gv")

map('c', '<C-a>', '<Home>', { silent = false })
map('c', '<C-e>', '<End>', { silent = false })
map('c', '<C-h>', '<Left>', { silent = false })
map('c', '<C-j>', '<Down>', { silent = false })
map('c', '<C-k>', '<Up>', { silent = false })
map('c', '<C-l>', '<Right>', { silent = false })
map('c', '<C-d>', '<Del>', { silent = false })
map('c', '<C-f>', '<C-R>=expand("%:p")<CR>', { silent = false })

-- Git
map('n', '<leader>gs', ':vert Git<CR>')
map('n', '<leader>gd', ':Gdiff<CR>')
map('n', '<leader>gn', 'ZZ:Gedit<CR>')
map('n', '<leader>gp', ':Git push -u<CR>')
map('n', '<leader>gl', ':Git pull<CR>')
map('n', '<leader>gba', ':Git blame<CR>')
map('n', '<leader>gbl', '<cmd>lua require"gitsigns".blame_line()<CR>')
map('n', '<leader>gt', ':Gclog --<CR>')
map('n', '<leader>gc', '<cmd>lua require"telescope.builtin".git_branches()<CR>')

map('n', '<leader>gm', ':Gvdiffsplit!<CR>')
map('n', '<leader>gh', ':diffget //3<CR>')
map('n', '<leader>gu', ':diffget //2<CR>')
map('n', '<leader>gx', '<c-w><c-o>')

map('n', '<leader>ghs', '<cmd>lua require"gitsigns".stage_hunk()<CR>')
map('n', '<leader>ghu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>')
map('n', '<leader>ghr', '<cmd>lua require"gitsigns".reset_hunk()<CR>')
map('n', '<leader>ghp', '<cmd>lua require"gitsigns".preview_hunk()<CR>')

-- Telescope
if utils.os.is_git_dir == 0 then
  map('n', '<leader>ff', '<cmd>lua require"telescope.builtin".git_files()<CR>')
else
  map('n', '<leader>ff', '<cmd>lua require"telescope.builtin".find_files()<CR>')
end
map('n', '<leader>fg', '<cmd>lua require"telescope.builtin".git_files()<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers theme=get_dropdown<CR>')
map('n', '<leader>fh', '<cmd>lua require"telescope.builtin".help_tags()<CR>')
map('n', '<leader>fo', '<cmd>lua require"telescope.builtin".oldfiles()<CR>')
map('n', '<leader>fr', '<cmd>lua require"telescope.builtin".live_grep()<CR>')
map('n', '<leader>fd', '<cmd>lua require"telescope.builtin".git_files({ cwd = "$HOME/.dotfiles" })<CR>')

map('n', '<leader>b', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>ft', '<cmd>NvimTreeFindFile<CR>')
map('n', '<leader>pr', '<cmd>NvimTreeRefresh<CR>')

map('n', '<leader>af', '<cmd>lua require("harpoon.mark").add_file()<CR>')
map('n', '<leader>ac', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')
map('n', '<leader>ah', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>')
map('n', '<leader>at', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>')
map('n', '<leader>an', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>')
map('n', '<leader>as', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>')

map('v', '<leader>re', '<cmd>lua require("refactoring").refactor("Extract Function")<CR>');

-- fun GotoWindow(id)
--     call win_gotoid(a:id)
--     MaximizerToggle
-- endfun

map('n', '<leader>dd', '<cmd>NvimTreeClose<CR><cmd>lua require("dapui").open()<CR><cmd>lua require("dap").continue()<CR>');
map('n', '<leader>de', '<cmd>lua require("dapui").close()<CR><cmd>lua require("dap.breakpoints").clear()<CR><cmd>NvimTreeOpen<CR><C-l>');
map('n', '<leader>m', '<cmd>MaximizerToggle<CR>');

map('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>');
map('n', '<leader>d<leader>', '<cmd>lua require("dap").continue()<CR>');

map('n', '<leader>dl', '<cmd>lua require"dap".step_over()<CR>');
map('n', '<leader>dj', '<cmd>lua require"dap".step_into()<CR>');
map('n', '<leader>dk', '<cmd>lua require"dap".step_out()<CR>');

map('n', '<leader>c', '<Nop>')
map('v', '<leader>c', '<Nop>')
map('n', '<leader>cr', '<Nop>')
map('v', '<leader>cr', '<Nop>')
-- map('n', '<leader>cr', '<Nop>')
-- map('v', '<leader>cr', '<Nop>')
map('n', '<leader>ca', '<cmd>lua require"jdtls".code_action()<CR>')
map('n', '<leader>co', '<cmd>lua require"jdtls".organize_imports()<CR>')
map('n', '<leader>crv', '<cd>lua require"jdtls".extract_variable()<CR>')
map('n', '<leader>crc', '<cmd>lua require"jdtls".extract_constant()<CR>')
map('n', '<leader>crm', '<cmd>lua require"jdtls".extract_method(true)<CR>')
map('v', '<leader>crm', '<cmd>lua require"jdtls".extract_method(true)<CR>')


map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>ca', '<cmd>lua require("jdtls").code_action()<CR>') -- jdtls should also work with other languages, a subset of <cmd>lua vim.lsp.buf.code_action
map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>pd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<leader>fp', '<cmd>lua vim.lsp.buf.formatting()<CR>')
