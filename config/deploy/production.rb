server "www.karlturner.co.uk", :app, :web
server "www.karlturner.co.uk", :db, :primary => true

set :user, "comingsoon"
set :env, "production"
set :rails_env, "production"

ssh_options[:keys] = '~/.ssh/movieposter.pem'