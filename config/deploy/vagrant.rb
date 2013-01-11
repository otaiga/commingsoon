server "33.33.0.3", :app, :web
server "33.33.0.3", :db, :primary => true

set :user, "comingsoon"
set :env, "vagrant"
set :rails_env, "vagrant"

ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/aws_app.pem"]