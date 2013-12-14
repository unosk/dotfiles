#!/bin/sh

rm -f ~/.zshrc     && ln -s `pwd`/zshrc     ~/.zshrc
rm -f ~/.vim       && ln -s `pwd`/vim       ~/.vim
rm -f ~/.vimrc     && ln -s `pwd`/vimrc     ~/.vimrc
rm -f ~/.gemrc     && ln -s `pwd`/gemrc     ~/.gemrc
rm -f ~/.tmux.conf && ln -s `pwd`/tmux.conf ~/.tmux.conf
rm -f ~/.gitconfig && ln -s `pwd`/gitconfig ~/.gitconfig
rm -f ~/.gitignore && ln -s `pwd`/gitignore ~/.gitignore

git submodule init
git submodule update
git submodule foreach 'git pull origin master'

echo ':NeoBundleInstall' | vim > /dev/null 2>&1
echo ':NeoBundleClean'   | vim > /dev/null 2>&1
