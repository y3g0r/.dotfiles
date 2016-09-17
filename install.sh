#!/usr/bin/env bash
# directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# vimrc
ln -sv "$DIR/vimrc" $HOME/.vimrc
