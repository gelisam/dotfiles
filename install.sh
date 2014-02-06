#!/bin/bash
set -e

DIR="$(dirname "$(readlink -f "$0")")"


function symlink {
  ln -s "$DIR/$1" "$HOME"
}

function on_login {
  echo ". \"$DIR/$1\"" >> "$HOME/$1"
}


symlink bin
symlink .gitconfig
symlink .inputrc
symlink .rxvtkeys
symlink .vim
symlink .vimrc
symlink .xmodmap
on_login .profile
on_login .bashrc

echo "Done. Type 'bash' to try your new environment."
