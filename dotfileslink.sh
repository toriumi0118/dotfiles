#!/bin/sh
SH_DIR=$(cd $(dirname $0);pwd)
ln -sf $SH_DIR/.gitconfig ~/.gitconfig
ln -sf $SH_DIR/.gvimrc ~/.gvimrc
ln -sf $SH_DIR/.ssh/config ~/.ssh/config
ln -sf $SH_DIR/.vim/colors/solarized.vim ~/.vim/colors/solarized.vim
ln -sf $SH_DIR/.vim/colors/desert.vim ~/.vim/colors/desert.vim
ln -sf $SH_DIR/.vim/colors/molokai.vim ~/.vim/colors/molokai.vim
ln -sf $SH_DIR/.vimrc ~/.vimrc
ln -sf $SH_DIR/.minttyrc ~/.minttyrc
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
source ~/.zshrc
