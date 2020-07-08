" extra

set showmatch     " hilight prens
set number        " line numbers
set list          " display whitespaces
set listchars=tab:>.,trail:_,extends:>,precedes:< " the whitespace characters
set cursorline    " highlight the entire line

" map jj as <Esc>
imap jj <Esc>

" map <C-s> to :update
noremap <silent> <C-S>      :update<CR>
vnoremap <silent> <C-S>     <C-C>:update<CR>
inoremap <silent> <C-S>     <C-O>:update<CR>

" split to the right
set splitright

" split to the bottom
set splitbelow

" display $ at the end of change
set cpoptions+=$

" use space
nnoremap <SPACE> <Nop>
let mapleader=" "
