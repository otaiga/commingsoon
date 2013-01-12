server "33.33.0.3", :app, :web
server "33.33.0.3", :db, :primary => true

set :user, "comingsoon"
set :env, "production"
set :rails_env, "production"

ssh_options[:keys] = '~/.ssh/movieposter.pem'