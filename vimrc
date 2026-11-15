" basics
source $HOME/dotfiles/vim/basic.vim

" extra
source $HOME/dotfiles/vim/extra.vim

" indentation
source $HOME/dotfiles/vim/indent.vim

" moving
source $HOME/dotfiles/vim/moving.vim

" searching
source $HOME/dotfiles/vim/search.vim

" plugin
source $HOME/dotfiles/vim/plug.vim

if filereadable(expand('~/dotfiles/vimrc.local'))
  source ~/dotfiles/vimrc.local
endif

" plugin settings
source $HOME/dotfiles/vim/plugin_setting.vim

" colors
source $HOME/dotfiles/vim/colors.vim
