call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'            " fuzzy file search
Plug 'tpope/vim-vinegar'

Plug 'itchyny/lightline.vim'
call plug#end()

" Install any missing plugins on startup
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \ | PlugInstall --sync | source $MYVIMRC
      \ | endif
