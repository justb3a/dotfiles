#!/usr/bin/env zsh

# ruby
brew install rbenv # restart terminal, then:
rbenv install -l | grep -v - | tail -1 # list latest available version
rbenv install $(rbenv install -l | grep -v - | tail -1)
rbenv versions
rbenv global x.x.x # set latest version

# node
curl -L https://git.io/n-install | bash
n lts
npm install -g npm@latest
npm update -g

# python
# first: find out the current python3 version in homebrew
# then install this version with pyenv and link it
brew install pyenv # restart terminal, then:
pyenv install $(pyenv install --list | grep -v - | grep -v b | tail -1)
pyenv versions
pyenv global xxx
