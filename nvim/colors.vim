set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

colorscheme monokai

if &term =~ "xterm-256color" || "screen-256color"
  " 256 colors
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax on

if g:colors_name == "monokai"
  hi Normal ctermbg=none
  hi NonText ctermbg=none
endif
