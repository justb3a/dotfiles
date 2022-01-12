#!/usr/bin/env zsh

brew install neovim --HEAD
brew install tmux
gem install neovim
pip install neovim

# Link config files
ln -s ~/Dotfiles/nvim ~/.config/nvim
ln -s ~/Dotfiles/tmux.conf ~/.tmux.conf

# vim and tmux plugin managers
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# additional language-servers for nvim-lspconfig
npm i -g eslint_d
npm i -g jsonlint
npm i -g markdownlint-cli
npm i -g npm-check-updates
npm i -g fixjson
npm i -g neovim
npm i -g prettier
npm i -g sort-package-json
npm i -g typescript
npm i -g typescript-language-server

# packer + treesitter
nvim +PackerSync +TSUpdate
nvim +checkhealth
