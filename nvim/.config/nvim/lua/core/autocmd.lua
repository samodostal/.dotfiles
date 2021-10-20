vim.cmd [[
  augroup ftplugin
   au!
    au FileType man setl laststatus=0 noruler
    au FileType vim,css,javascript,lua,sh,zsh setl sw=2
    au TermOpen term://* setl nornu nonu nocul so=0 scl=no
  augroup END

  augroup highlight_yank
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 150 }
  augroup END

  augroup transparent_background
    au!
    au ColorScheme * hi Normal ctermbg=none guibg=none
    au ColorScheme * hi SignColumn ctermbg=none guibg=none
    au ColorScheme * hi CursorLineNr guifg=#fabd2f guibg=none ctermbg=none
    au ColorScheme * hi GitSignsAdd guifg=#009900 guibg=none ctermbg=none
    au ColorScheme * hi GitSignsDelete guifg=#ff2222 guibg=none ctermbg=none
    au ColorScheme * hi GitSignsChange guifg=#2871cc guibg=none ctermbg=none
    au ColorScheme * hi QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    au ColorScheme * hi QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    au ColorScheme * hi LineNr guifg=#bbbbbb
    au ColorScheme * hi DiffAdd guifg=#009900
    au ColorScheme * hi DiffDelete guifg=#ff2222
    au ColorScheme * hi DiffChange guifg=#2871cc
  augroup END
]]
