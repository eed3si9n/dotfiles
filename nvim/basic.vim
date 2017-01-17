" basic setups

set nocompatible
set hidden      " allow editing multiple files
set nobackup
set autoread
set noswapfile
set backspace=indent,eol,start
set vb t_vb=
set noshowmode
set modelines=0
set notitle


" detect file type
filetype plugin on

" *.md is markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
