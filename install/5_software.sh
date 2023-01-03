#!/usr/bin/env zsh
brew tap buo/cask-upgrade
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

brew install --cask firefox
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask notion
brew install --cask telegram
brew install --cask visual-studio-code
brew install --cask zoom

# afterwards, import settings from : `RectangeConfig.json`
brew install --cask rectangle

# Quick Look syntax highlight
brew install --cask syntax-highlight

# Quicklook-reset, kill finder, start App "Syntax Highlight"
qlmanage -r
qlmanage -r cache

# Drivers and other software
brew install --cask font-fira-code-nerd-font
