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
brew cask install sequel-pro
brew cask install cyberduck
brew cask install caskroom/fonts/font-fira-code

brew cask install spectacle
# Spectacle saves its settings in a JSON file located at
# `~/Library/Application Support/Spectacle/Shortcuts.json`.
# To import a previously saved settings file, save it to this path and restart Spectacle.
# @see: `spectacle/Shortcuts.json`

# set some options for qlcolorcode
defaults write org.n8gray.QLColorCode font "Fira Code"
defaults write org.n8gray.QLColorCode fontSizePoints 9
defaults write org.n8gray.QLColorCode hlTheme blacknblue
defaults write org.n8gray.QLColorCode extraHLFlags '--replace-tabs=2'
qlmanage -r
