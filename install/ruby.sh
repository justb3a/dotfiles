# install a current ruby version
rbenv install 2.4.2
rbenv global 2.4.2

# rbenv version
# system (set by /Users/xx/.rbenv/version) FAILURE
# 2.4.2 (set by /Users/xx/.rbenv/version)  SUCCESS
# test: curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

#!/usr/bin/env bash

gem install bundler --no-ri --no-rdoc
gem install sass --pre --no-ri --no-rdoc
gem install compass --pre --no-ri --no-rdoc
gem install dandelion --no-ri --no-rdoc
gem install net-sftp --no-ri --no-rdoc
gem install capistrano --no-ri --no-rdoc
gem install scss-lint --no-ri --no-rdoc
gem install chef --no-ri --no-rdoc
gem install berkshelf --no-ri --no-rdoc
