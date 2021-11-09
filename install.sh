#!/bin/bash
set -e

function abs {
  echo "$1" | sed 's!^\.!'"$(pwd)"'!g'
}

DIR="$(dirname "$(abs "$0")")"


function symlink {
  ln -s "$DIR/$1" "$HOME"
}

function on_login {
  echo ". \"$DIR/$1\"" >> "$HOME/$1"
}


symlink bin-common
symlink bin-fedora
symlink bin-nix
mkdir -p ~/.cabal/bin-fedora
mkdir -p ~/.cabal/bin-nix
mkdir -p ~/.local/bin-fedora
mkdir -p ~/.local/bin-nix
symlink .gitconfig
symlink .inputrc
symlink .rxvtkeys
symlink .vim
symlink .vimrc
symlink .kmonad.kbd
on_login .profile
on_login .bashrc

echo "Done. Type 'bash' to try your new environment."
