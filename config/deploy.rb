require 'bundler/capistrano'
require 'capistrano/ext/multistage'
require "whenever/capistrano"

set :stages, %w( vagrant puppet_vagrant production puppet_production )

set :application, "comingsoon"
set :repository,  "git@github.com:otaiga/commingsoon.git"

set :scm, :git

set :deploy_to, "/var/apps/comingsoon"

set :use_sudo, false  # not using sudo - no need

#The below allows copy (no need for ssh keys, etc on the remote server)
set :deploy_via, :copy
set :copy_strategy, :export

set :whenever_command, "bundle exec whenever"
set :whenever_environment, defer { stage }


# if you want to clean up old releases on each deploy do this:
after "deploy:restart", "deploy:cleanup"


# If you are using Passenger mod_rails do this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

# Create the db's in cold deploy
  desc "cold deploy: update, create_db, start"
  task :cold do       # Overriding the default deploy:cold
    update
    create_db       # My own step
    start
  end

# Add the below to copy a config yml from shared dir.
  desc "Copy the config.yml file into the latest release"
  task :copy_in_config_yml do
      run "cp #{shared_path}/config/config.yml #{latest_release}/config/"
  end

# Create DBs
  desc "Create the databases"
  task :create_db, :roles => :db do
    run "cd #{current_path};bundle exec rake db:create RAILS_ENV=#{rails_env};bundle exec rake db:migrate RAILS_ENV=#{rails_env}"
  end

end

after "deploy:update_code", "deploy:copy_in_config_yml"
before "deploy:migrate", "deploy:copy_in_config_yml"
before "deploy:assets:precompile", "deploy:copy_in_config_yml"