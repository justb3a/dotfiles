#!/usr/bin/env bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# brew paths
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# install some neccessary brew packages
brew tap homebrew/services

# install brew packages
brew install bat
brew install clipper
brew install coreutils
brew install curl
brew install diff-so-fancy
brew install exa
brew install fzf
brew install ghostscript
brew install git
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
brew install python3
brew install rbenv
brew install reattach-to-user-namespace
brew install rsync
brew install ruby
brew install ruby-build
brew install ssh-copy-id
brew install the_silver_searcher
brew install tmux
brew install unrar
brew install wget
brew install yarn
brew install zsh

# link keg-only / pre-installed duplicates
brew link --force curl
