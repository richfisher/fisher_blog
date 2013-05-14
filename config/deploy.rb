require "bundler/capistrano"
# require 'sidekiq/capistrano'
load "config/recipes/base"
load "config/recipes/rvm"
load "config/recipes/mysql"
load "config/recipes/redis"
load "config/recipes/nginx"
load "config/recipes/unicorn"

server "175.41.178.18", :web, :app, :db, primary: true

set :user, "ec2-user"
set :application, "fisher_blog"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, true

set :scm, "git"
set :repository, "git@github.com:richfisher/#{application}.git"
set :branch, "develop"

ssh_options[:keys] = ["~/fisher.pem"]
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

task :chown_project_to_ec2_user do 
	run "#{sudo} chown -R ec2-user:ec2-user #{deploy_to}"
end

task :ln_database_yml do 
	run "ln -sf #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end

after 'bundle:install', :ln_database_yml
after 'deploy:update_code', 'deploy:migrate'
after "deploy", "deploy:cleanup"

# Run following command first time.
# cap deploy:install
# cap deploy:setup
# cap deploy
# cap deploy:start