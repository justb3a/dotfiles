#!/usr/bin/env bash

# to keep ~/.vimrc you source it from the new location
mkdir -p ~/.config/nvim
echo 'source ~/.vimrc' > ~/.config/nvim/init.vim

# install deps + plugins for neovim
pip3 install pynvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.config/nvim/dein
rm installer.sh
mv .config/nvim/dein .vim

# node
npm install -g neovim
npm install -g pure-prompt
npm install -g yarn
npm install -g tern
npm install -g import-js
