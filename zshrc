## basic
[ -f $HOME/dotfiles/zshrc.basic ] && source $HOME/dotfiles/zshrc.basic

## aliases
#
[ -f $HOME/dotfiles/zshrc.alias ] && source $HOME/dotfiles/zshrc.alias

case "${OSTYPE}" in
# MacOSX
darwin*)
  [ -f $HOME/dotfiles/zshrc.osx ] && source $HOME/dotfiles/zshrc.osx
  ;;
# Linux
linux*)
  [ -f $HOME/dotfiles/zshrc.linux ] && source $HOME/dotfiles/zshrc.linux
  ;;
esac

## color
[ -f $HOME/dotfiles/zshrc.color ] && source $HOME/dotfiles/zshrc.color

