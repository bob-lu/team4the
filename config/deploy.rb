# Run bundle install after deploy.
require "bundler/capistrano"

# Assets compiling
load 'deploy/assets'

set :application, "team4the"

set :scm, :git
set :repository,  "git@github.com:boena/team4the.git"
set :branch, "master"
set :git_enable_submodules, 1

set :user, "root"  # The server's user for deploys
set :port, 2810
set :rake, "bundle exec rake"

set :deploy_to, "/var/www/team4the"
set :keep_releases, 10

# Remote caching will keep a local git repo on the server you’re deploying to and
# simply run a fetch from that rather than an entire clone.
set :deploy_via, :remote_cache

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
ssh_options[:forward_agent] = true # Use your local keys and not the servers

server "5.79.27.76", :app, :web, :db, :primary => true

# Passenger setup.
namespace :deploy do
 task :start do ; end
 task :stop do ; end

 desc "Restart Application"
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end

 # To change permissions on folder so www-data owns it.
 task :set_permissions, :roles => :app, :except => { :no_release => true } do
   run "chown -R www-data:www-data /var/www"
 end 
end

# After regular deploy, run custom tasks.
after "deploy", "deploy:set_permissions"
after "deploy:migrations", "deploy:set_permissions"
