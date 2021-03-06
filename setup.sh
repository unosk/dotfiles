#!/bin/sh

rm -f ~/.zshrc     && ln -s `pwd`/zshrc     ~/.zshrc
rm -f ~/.vim       && ln -s `pwd`/vim       ~/.vim
rm -f ~/.vimrc     && ln -s `pwd`/vimrc     ~/.vimrc
rm -f ~/.gemrc     && ln -s `pwd`/gemrc     ~/.gemrc
rm -f ~/.pryrc     && ln -s `pwd`/pryrc     ~/.pryrc
rm -f ~/.tmux.conf && ln -s `pwd`/tmux.conf ~/.tmux.conf
rm -f ~/.gitconfig && ln -s `pwd`/gitconfig ~/.gitconfig
rm -f ~/.gitignore_global && ln -s `pwd`/gitignore_global ~/.gitignore_global
rm -f ~/.gitattributes_global && ln -s `pwd`/gitattributes_global ~/.gitattributes_global

git submodule init
git submodule update
git submodule foreach 'git pull origin master'

echo ':NeoBundleInstall' | vim > /dev/null 2>&1
echo ':NeoBundleClean'   | vim > /dev/null 2>&1
