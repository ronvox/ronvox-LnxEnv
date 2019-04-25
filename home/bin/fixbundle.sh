#!/bin/bash

## fix permissions first:
cd ~/.vim/bundle
sudo find ~/.vim/bundle \! -user ronvox -exec chown ronvox:ronvox {} \;
find ~/.vim/bundle -type d -exec chmod 755 {} \;
find ~/.vim/bundle -type f -exec chmod 640 {} \;

## now time to reset and clone back:
cd ~/.vim/bundle/tlib_vim
git status
git reset --hard
git pull

cd ~/.vim/bundle/fonts
git status
git reset --hard
git pull

cd ~/.vim/bundle/vim-colorschemes
git status
git reset --hard
git pull

cd ~/.vim/bundle/vim-signify
git status
git reset --hard
git pull

cd ~/.vim/bundle/vim-textobj-sentence
git status
git reset --hard
git pull

cd ~/.vim/bundle/vim-textobj-quote
git status
git reset --hard
git pull

cd ~/.vim/bundle/syntastic
git status
git reset --hard
git pull

cd ~/.vim/bundle/neosnippet
git status
git reset --hard
git pull

cd ~/.vim/bundle/vim-snippets
git status
git reset --hard
git pull

cd ~/.vim/bundle/PIV
git status
git reset --hard
git pull

cd ~/.vim/bundle/python-mode/
git status
git reset --hard
git pull

cd ~/.vim/bundle/rust.vim/
git status
git reset --hard
git pull

cd ~/.vim/bundle/vim-ctrlspace/
git status
git reset --hard
git pull

cd ~/.vim/bundle/vim-gitgutter/
git status
git reset --hard
git pull

cd ~/.vim/bundle/vimproc.vim/
git status
git reset --hard
git pull

cd ~/.vim/bundle/gundo.vim/
git status
git reset --hard
git pull

sudo find ~/.vim/bundle \! -user ronvox -exec chown ronvox:ronvox {} \;
