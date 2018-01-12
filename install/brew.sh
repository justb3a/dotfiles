#!/usr/bin/env bash

brew tap caskroom/versions
brew tap buo/cask-upgrade

# install brew packages
brew install ghostscript
brew install git-flow
brew install imagemagick
brew install macvim
brew install markdown
brew install mcrypt
brew install mysql
brew install node
brew install reattach-to-user-namespace
brew install composer
brew install rbenv
brew install ruby-build
brew install ssh-copy-id
brew install the_silver_searcher
brew install unrar
brew install wget
brew install youtube-dl


# brew cask and install software
brew cask install alfred
brew cask install bill
brew cask install carbon-copy-cloner
brew cask install dash
brew cask install doxie
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install imagealpha
brew cask install imageoptim
brew cask install kap
brew cask install karabiner-elements
brew cask install ngrok
brew cask install ocenaudio
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install sequel-pro
brew cask install signal
brew cask install sketch
brew cask install skype
brew cask install slack
brew cask install spotify
brew cask install telegram
brew cask install virtualbox
brew cask install vlc
brew cask install xld

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

# the rest -> appstore or adobe or others :-)
