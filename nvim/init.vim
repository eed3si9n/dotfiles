let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

" basics
source $HOME/dotfiles/nvim/basic.vim

" extra
source $HOME/dotfiles/nvim/extra.vim

" indentation
source $HOME/dotfiles/nvim/indent.vim

" moving
source $HOME/dotfiles/nvim/moving.vim

" searching
source $HOME/dotfiles/nvim/search.vim

" plugins
source $HOME/dotfiles/nvim/plugins.vim

" colors
source $HOME/dotfiles/nvim/colors.vim

:lua require('lsp')
