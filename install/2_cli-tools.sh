#!/usr/bin/env zsh

brew tap homebrew/cask-drivers
brew tap homebrew/services

# install additional brew packages -- see _install.sh too
brew install bat
brew install clipper
brew install fd
brew install ffmpeg
brew install fzf
brew install ghostscript
brew install glances
brew install jump
brew install lazygit
brew install mozjpeg
brew install nnn
brew install npkill
brew install ripgrep
brew install rsync
brew install the_silver_searcher
brew install tree
brew install unrar
brew install wget

# nnn plugins
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

ln -s ~/Dotfiles/lazygit ~/.config/lazygit
ln -s ~/Dotfiles/lazygit ~/Library/Application\ Support/lazygit
ln -s ~/Dotfiles/yamllint.yml ~/.config/yamllint/config

# node cli tools and helpers
npm install -g diff-so-fancy
npm install -g fkill-cli
npm install -g npkill
npm install -g trash-cli
npm install -g vtop

# install fzf
/opt/homebrew/opt/fzf/install

# clipper
mkdir -p ~/Library/LaunchAgents
brew services start clipper
