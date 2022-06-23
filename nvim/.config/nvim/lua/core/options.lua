local o = vim.opt

o.wrap = false

o.number = true
o.relativenumber = true
o.numberwidth = 1

o.signcolumn = "yes"
o.termguicolors = true

o.scrolloff = 8
o.sidescrolloff = 8

o.autoindent = true
o.smartindent = true
o.autoread = true

o.colorcolumn = '80'
o.guicursor = 'i:block'

o.hidden = true
o.ignorecase = true
o.smartcase = true
o.lazyredraw = true

o.matchpairs = "(:),{:},[:],<:>"
o.preserveindent = true

o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2

o.splitbelow = true
o.splitright = true

o.swapfile = false
o.undofile = true

o.shortmess = o.shortmess
+ {
  A = true,
  I = true,
  W = true,
}

o.formatoptions = o.formatoptions
+ {
  c = false,
  o = false,
  r = true,
}
