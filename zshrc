# The following two lines were added by the sbt installSbtn task:
fpath=($fpath /Users/eed3si9n/.sbt/1.0/completions)
autoload -Uz compinit; compinit
## basic
[ -f $HOME/dotfiles/zshrc.basic ] && source $HOME/dotfiles/zshrc.basic

## app configurations
[ -f $HOME/dotfiles/zshrc.appconfig ] && source $HOME/dotfiles/zshrc.appconfig

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

## local
[ -f $HOME/dotfiles/zshrc.local ] && source $HOME/dotfiles/zshrc.local

## auto comp
autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

path=($path /Users/eed3si9n/.sbt/1.0/bin)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
