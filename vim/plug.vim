call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'            " fuzzy file search
" Plug 'sickill/vim-monokai'
call plug#end()
