#!/usr/bin/env bash

# install xcode and other software from the app store
# everything neccessary first - command line tools
xcode-select --install

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# brew paths
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# install some neccessary brew packages
brew install git
brew install neovim --HEAD
brew install python3
brew install tmux
brew install zsh
brew install coreutils

brew tap homebrew/services

# to keep ~/.vimrc you source it from the new location
mkdir -p ~/.config/nvim
echo 'source ~/.vimrc' > ~/.config/nvim/init.vim

# install deps + plugins for neovim
pip3 install neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.config/nvim/dein
rm installer.sh

# set xterm/screen terminals to enable italic fonts in terminal
tic ~/dotfiles/other/xterm-256color.terminfo

# link the dotfiles
ln -s ~/dotfiles/agignore ~/.agignore
ln -s ~/dotfiles/editorconfig ~/.editorconfig
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup

# now restart your terminal and hope for the best

# set zsh to the default
sudo vim /etc/shells
chsh -s /usr/local/bin/zsh
/usr/bin/env zsh
sudo mv /etc/zshenv /etc/zprofile
sudo launchctl config user path $PATH
