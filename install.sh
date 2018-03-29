#!/usr/bin/env bash
# directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# vimrc
ln -sv "$DIR/vimrc" $HOME/.vimrc
ln -sv "$DIR/tmux.conf" $HOME/.tmux.conf
ln -sv "$DIR/gitconfig" $HOME/.gitconfig
