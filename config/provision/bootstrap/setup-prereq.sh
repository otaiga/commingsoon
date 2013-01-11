sudo apt-get update -y
sudo apt-get upgrade -y --show-upgrade
sudo apt-get install -y curl git-core libcurl4-openssl-dev openssl libreadline-dev libssl-dev libyaml-dev \
                        zlib1g-dev build-essential python-software-properties ruby1.9.3 rubygems \
                        libmysqlclient-dev puppet libapr1-dev libaprutil1-dev bzip2 apache2-prefork-dev \
                        libreadline6 libreadline6-dev
sudo ln -sf /usr/bin/ruby1.9.3 /etc/alternatives/ruby
sudo ln -sf /usr/bin/gem1.9.3 /etc/alternatives/gem
sudo gem install rails --no-ri --no-rdoc
sudo rm -rf /etc/puppet
sudo cp -r $HOME/provision/puppet /etc/