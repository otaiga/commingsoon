server "33.33.0.3", :app, :web
server "33.33.0.3", :db, :primary => true

set :user, "vagrant"
set :env, "vagrant"
set :rails_env, "vagrant"

# This uses the key for vagrant box.
ssh_options[:keys] = '~/.vagrant.d/insecure_private_key'

namespace :puppet do
  task :bootstrap do
    system "config/provision/bootstrap/bootstrap_vagrant.sh"
  end

  task :apply do
    # need to set --environment my_environment otherwise apache conf file will
    # default to production
    run "sudo puppet apply /etc/puppet/manifests/site.pp --environment #{rails_env}"
  end
end