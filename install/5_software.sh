#!/usr/bin/env zsh
brew tap buo/cask-upgrade
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

brew install --cask firefox
brew install --cask google-chrome
brew install --cask qlstephen
brew install --cask syntax-highlight
brew install --cask notion
brew install --cask telegram
brew install --cask zoom

brew install --cask spectacle
# Spectacle saves its settings in a JSON file located at
# `~/Library/Application Support/Spectacle/Shortcuts.json`.
# To import a previously saved settings file, save it to this path and restart Spectacle.
# @see: `spectacle/Shortcuts.json`

# Quicklook-reset
xattr -cr ~/Library/QuickLook
xattr -d -r com.apple.quarantine ~/Library/QuickLook
qlmanage -r
qlmanage -r cache

# Drivers and other software
brew install --cask font-fira-code-nerd-font
