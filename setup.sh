#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$HOME/dotfiles                    # dotfiles directory
olddir=$HOME/dotfiles_old             # old dotfiles backup directory
DOT_FILES=( .zshrc .zshrc.alias .zshrc.osx )

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in ${DOT_FILES[@]}
do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv $HOME/$file $HOME/dotfiles_old/
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file $HOME/$file
done
