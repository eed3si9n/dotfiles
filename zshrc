## auto comp
autoload -U compinit
compinit

## prompts
PROMPT="[%m:%~]$ "

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
unset LSCOLORS

case "${TERM}" in
xterm)
  export LSCOLORS=dxfxcxdxbxegedabagacad
  ;;
xterm*)
  export LSCOLORS=dxfxcxdxbxegedabagacad
  ;;
dumb)
  ;;
esac
