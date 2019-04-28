#!/usr/bin/env bash

brew tap caskroom/versions
brew tap buo/cask-upgrade

# install brew packages
brew install clipper
brew install composer
brew install curl
brew install diff-so-fancy
brew install elixir

brew install erlang
# Pretty Eshell: https://github.com/spawnfest/ErlShell

brew install fzf
brew install ghostscript
brew install git
brew install git-flow
brew install imagemagick
brew install jq
brew install markdown
brew install mariadb
brew install mcrypt
brew install mozjpeg
brew install neovim
brew install ngnix
brew install node
brew install openssl
brew install php
brew install python
brew install rbenv
brew install reattach-to-user-namespace
brew install rsync
brew install ruby
brew install ruby-build
brew install ssh-copy-id
brew install the_silver_searcher
brew install tmux
brew install unrar
brew install vim
brew install wget
brew install yarn
brew install zsh

# quicklook stuff
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install quicklook-csv
brew cask install betterzipql

# set some options for qlcolorcode
defaults write org.n8gray.QLColorCode font Menlo
defaults write org.n8gray.QLColorCode fontSizePoints 8
# maybe you have to copy solarized-dark into the caskroom to use it
# have a look a the most current github repo for qlcolorcode
defaults write org.n8gray.QLColorCode hlTheme solarized-dark
qlmanage -r
