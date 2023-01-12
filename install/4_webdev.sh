#!/usr/bin/env zsh

brew install imagemagick
brew install jq
brew install stylelint
brew install yamllint

`jq .scripts package.json`

# additional webdev cli tools
npm install -g depcheck
npm install -g npm-check
npm install -g npm-check-updates
npm install -g yarn

# fonts
npm install -g ttf2woff
git clone --recursive https://github.com/google/woff2.git
cd woff2
make clean all
