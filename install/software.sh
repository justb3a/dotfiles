#!/usr/bin/env bash
brew tap homebrew/cask-versions
brew tap buo/cask-upgrade
brew tap homebrew/cask-fonts

# quicklook stuff
brew install --cask qlcolorcode
brew install --cask qlstephen
brew install --cask qlmarkdown
brew install --cask quicklook-json
brew install --cask quicklook-csv
brew install --cask betterzipql
brew install --cask sequel-pro
brew install --cask cyberduck
brew install --cask caskroom/fonts/font-fira-code
brew install --cask notion
brew install --cask insomnia

brew install --cask spectacle
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

# https://support.1password.com/cs/1password-classic-extension/
