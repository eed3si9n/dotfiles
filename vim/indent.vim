" indentationn

" tab key inserts whitespaces
set expandtab

set autoindent    " automatically indent
set smartindent   " use the same amount of indentation from the prev line
set cindent       " for C language

set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  " filetype plugin on " use filetype
  " filetype indent on " indent based on the filetype
  autocmd FileType scala setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vim   setlocal sw=2 sts=2 ts=2 et
endif
