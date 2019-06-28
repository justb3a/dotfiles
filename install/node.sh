# use nvm instead of brew node or anything else
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

nvm install 6.11.5
nvm install 8.10.0
nvm use 8.10.0
nvm alias default 8.10.0

npm install -g npm@latest
npm update -g

npm install -g diff-so-fancy
npm install -g eslint
npm install -g eslint-config-xo-space
npm install -g fkill-cli
npm install -g gulp
npm install -g htmlhint
npm install -g jsonlint
npm install -g npm-check-updates
npm install -g pure-prompt
npm install -g sass-lint
npm install -g trash-cli
npm install -g vtop
npm install -g prettier
npm install -g yarn
