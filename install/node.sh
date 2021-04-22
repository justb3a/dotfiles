# use nvm instead of brew node or anything else
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

nvm install 15
nvm use 15
nvm alias default 15

npm install -g npm@latest
npm update -g

npm install -g diff-so-fancy
npm install -g eslint
npm install -g eslint-config-xo-space
npm install -g fkill-cli
npm install -g jsonlint
npm install -g neovim
npm install -g npm-check-updates
npm install -g pure-prompt
npm install -g sass-lint
npm install -g sort-package-json
npm install -g trash-cli
npm install -g vtop
npm install -g prettier
npm install -g yarn
npm install -g tern
npm install -g typescript
npm install -g import-js

npm install -g htmlhint
npm install -g @11ty/eleventy
npm install -g gulp
