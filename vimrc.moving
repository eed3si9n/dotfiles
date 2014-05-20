" moving

" Use Shift-arrows to select the active split!
noremap <silent> <S-Up> :wincmd k<CR>
imap <S-Up> <Esc><S-Up>
noremap <silent> <S-Down> :wincmd j<CR>
imap <S-Down> <Esc><S-Down>
noremap <silent> <S-Left> :wincmd h<CR>
imap <S-Left> <Esc><S-Left>
noremap <silent> <S-Right> :wincmd l<CR>
imap <S-Right> <Esc><S-Right>

" On Mac Option-arrows are mapped to these
" noremap <silent> <Esc>B :wincmd h<CR>
" noremap <silent> <Esc>F :wincmd l<CR>

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

