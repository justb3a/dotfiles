#!/usr/bin/env bash
brew tap caskroom/versions
brew tap buo/cask-upgrade

# quicklook stuff
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install quicklook-csv
brew cask install betterzipql

# set some options for qlcolorcode
defaults write org.n8gray.QLColorCode font "Fira Code"
defaults write org.n8gray.QLColorCode fontSizePoints 9
defaults write org.n8gray.QLColorCode hlTheme blacknblue
defaults write org.n8gray.QLColorCode extraHLFlags '--replace-tabs=2'
qlmanage -r
