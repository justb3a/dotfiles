#!/usr/bin/env zsh
brew tap buo/cask-upgrade
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

brew install --cask firefox
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask qlstephen
brew install --cask syntax-highlight
brew install --cask notion
brew install --cask telegram
brew install --cask visual-studio-code
brew install --cask zoom

brew install --cask rectangle
# afterwards, import settings from : `RectangeConfig.json`

# Quicklook-reset
qlmanage -r
qlmanage -r cache

# Drivers and other software
brew install --cask font-fira-code-nerd-font
