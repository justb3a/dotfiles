#!/usr/bin/env bash

# install xcode and other software from the app store
# everything neccessary first - command line tools
xcode-select --install

# to keep ~/.vimrc you source it from the new location
mkdir -p ~/.config/nvim
echo 'source ~/.vimrc' > ~/.config/nvim/init.vim

# install deps + plugins for neovim
pip3 install neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.config/nvim/dein
rm installer.sh

# set xterm/screen terminals to enable italic fonts in terminal
tic ~/dotfiles/zsh/xterm-256color.terminfo

# link the dotfiles
ln -s ~/dotfiles/agignore ~/.agignore
ln -s ~/dotfiles/editorconfig ~/.editorconfig
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/importjs.js ~/.importjs.js
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/tern-project ~/.tern-project
ln -s ~/dotfiles/zsh/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup

# now restart your terminal and hope for the best

# set zsh to the default
sudo vim /etc/shells
  add `/usr/local/bin/zsh`
chsh -s /usr/local/bin/zsh
/usr/bin/env zsh
sudo launchctl config user path $PATH
