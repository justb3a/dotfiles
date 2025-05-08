#!/usr/bin/env bash
# Install xcode and other software from the app store
# Everything neccessary first - command line tools
xcode-select --install
sudo xcodebuild -license

# > Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "name"
sudo scutil --set LocalHostName "name"
sudo scutil --set HostName "name"

# > Default macos settings

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Finder: show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

# > Homebrew

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo ln -s /opt/homebrew/bin /usr/local/bin
brew doctor

# Brew paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Basics
brew install curl
brew install eza
brew install git
brew install neovim --HEAD
brew install openssl
brew install zsh
# link keg-only / pre-installed duplicates
brew link --force curl

# > Dotfile symlinks
mkdir ~/.config
cd ~/Dotfiles
ln -s ~/Dotfiles/ignore ~/.ignore
ln -s ~/Dotfiles/editorconfig ~/.editorconfig
ln -s ~/Dotfiles/gitconfig ~/.gitconfig
ln -s ~/Dotfiles/gitignore ~/.gitignore
ln -s ~/Dotfiles/zsh ~/.zsh
ln -s ~/Dotfiles/zsh/zshrc ~/.zshrc

# to be reconsidered
ln -s ~/Dotfiles/vim/vimrc ~/.vimrc
ln -s ~/Dotfiles/tern-project ~/.tern-project
ln -s ~/Dotfiles/zsh/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup

# Set xterm/screen terminals to enable italic fonts in terminal
tic ~/Dotfiles/zsh/xterm-256color.terminfo

# Set zsh to the default
sudo vim /etc/shells
add `/usr/local/bin/zsh`
chsh -s /usr/local/bin/zsh
/usr/bin/env zsh
sudo launchctl config user path $PATH

autoload -Uz compinit
compinit
# now restart your terminal and proceed...
