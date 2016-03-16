#! /usr/bin/env zsh

# Ensure that tmux windows are by default named after the shell, rather than
# full path to the shell binary.
shell=$(basename "$SHELL")

# If reattach-to-user-namespace is not available, just run the command.
if [ -n "$(command -v reattach-to-user-namespace)" ]; then
  reattach-to-user-namespace -l "$shell"
else
  exec "$shell"
fi

