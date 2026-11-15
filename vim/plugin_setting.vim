" --- Statusline ---
set laststatus=2
set noshowmode
let g:lightline = {'colorscheme': 'molokai'}
if get(g:, 'powerline_fonts', 0)
  let g:lightline.separator    = {'left': "\ue0b0", 'right': "\ue0b2"}
  let g:lightline.subseparator = {'left': "\ue0b1", 'right': "\ue0b3"}
endif

if isdirectory(get(get(g:, 'plugs', {}), 'fzf.vim', {'dir': ''}).dir)
  nnoremap <leader>f :GFiles<CR>
  nnoremap <leader>/ :Rg<CR>       " search file contents (needs ripgrep)
  nnoremap <leader>b :Buffers<CR>
endif

" toggle comments
nmap <leader>c gcc
xmap <leader>c gc
