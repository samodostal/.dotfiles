local o = vim.opt

o.wrap = false

o.number = false
o.relativenumber = true
o.numberwidth = 1

o.signcolumn = 'yes:1'
o.cursorline = true
o.termguicolors = true

o.scrolloff = 8
o.sidescrolloff = 8
o.splitkeep = 'screen'

o.autoindent = true
o.smartindent = true
o.autoread = true

o.guicursor = 'i:block'

o.hidden = true
o.ignorecase = true
o.smartcase = true
o.lazyredraw = true
o.hlsearch = false

o.matchpairs = '(:),{:},[:],<:>'
o.preserveindent = true
o.laststatus = 3

o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2

o.splitbelow = true
o.splitright = true

o.swapfile = false
o.undofile = true

o.completeopt = 'menu,menuone,noselect'
o.showmode = false

o.shortmess = o.shortmess + {
	A = true,
	I = true,
	W = true,
}

o.fillchars = o.fillchars + {
	eob = ' ',
}

vim.g.loaded_ruby_provider = false
vim.g.loaded_perl_provider = false

-- formatoptions overriden by ftplugin (:verbose set formatoptions)
vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		o.formatoptions:remove 'o'
	end,
})
