#!/usr/bin/env bash

brew tap homebrew/dupes
brew tap josegonzalez/homebrew-php
brew tap homebrew/services

# install brew packages
brew install curl
brew install ghostscript
brew install git-flow
brew install httpd
brew install imagemagick
brew install macvim
brew install markdown
brew install mcrypt
brew install mysql
brew install node
brew install reattach-to-user-namespace
brew install php55
brew install php55-mcrypt
brew install php55-xdebug
brew install composer
brew install rbenv
brew install ruby-build
brew install ssh-copy-id
brew install subversion
brew install the_silver_searcher
brew install unrar
brew install wget
brew install youtube-dl

# brew cask and install software

brew cask install adium
brew cask install alfred
brew cask install bartender
brew cask install bill
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install imagealpha
brew cask install imageoptim
# brew cask install keyremap4macbook
brew cask install libreoffice
brew cask install miro-video-converter
brew cask install opera
# brew cask install pckeyboardhack
brew cask install sequel-pro
brew cask install skype
brew cask install slate
brew cask install truecrypt
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc

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
