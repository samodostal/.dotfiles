local o = vim.opt
-- Appearance
o.cmdheight = 1
o.colorcolumn = '80'
o.number = true
o.relativenumber = true
o.numberwidth = 1
o.guicursor = 'i:block'
o.showmode = false
o.signcolumn = 'yes'
o.cursorline = false
o.termguicolors = true
o.hlsearch = false
o.wrap = false

-- Backups
o.backup = false
o.writebackup = false
o.swapfile = false
o.autoread = true

-- Completion
o.completeopt = 'menuone,noselect'
o.pumblend = 10 -- Popup menu transparency
o.pumheight = 8 -- Popup menu height

-- General
-- o.clipboard = 'unnamedplus'
o.hidden = true
o.joinspaces = false
o.scrolloff = 8
o.sidescrolloff = 8
o.splitbelow = true
o.splitright = true
o.timeoutlen = 1000
o.updatetime = 100
o.virtualedit = 'block'
o.iskeyword = o.iskeyword + '-'

-- Performance
o.lazyredraw = true

-- Search
o.inccommand = 'nosplit' -- show substitutions incrementally
o.ignorecase = true
o.smartcase = true
o.wildignore = { '.git/*', 'node_modules/*' }
o.wildignorecase = true

-- Tabs
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2

-- Shortmess
o.shortmess = o.shortmess
  + {
    A = true, -- don't give the "ATTENTION" message when an existing swap file is found.
    I = true, -- don't give the intro message when starting Vim |:intro|.
    W = true, -- don't give "written" or "[w]" when writing a file
    c = true, -- don't give |ins-completion-menu| messages
    m = true, -- use "[+]" instead of "[Modified]"
  }

-- Format options
vim.api.nvim_exec([[
  augroup echo_formatoptions
    autocmd!
    autocmd BufEnter * set formatoptions-=cro
  augroup END
]], false)

-- Remove builtin plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_zip = 1
