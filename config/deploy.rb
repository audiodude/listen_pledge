#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_type, :user 

require "bundler/capistrano"

load 'deploy/assets'

set :application, "Listen Pledge"
set :repository,  "git@github.com:audiodude/Listen-Pledge.git"

set :scm, :git
set :branch, :master
set :deploy_via, :remote_cache
set :deploy_to, "/opt/listenpledge/"

role :web, "listenpledge.com:4242"                          # Your HTTP server, Apache/etc
role :app, "listenpledge.com:4242"                          # This may be the same as your `Web` server
role :db,  "listenpledge.com:4242", :primary => true        # This is where Rails migrations will run

set :user, "listenpledge"

ssh_options[:forward_agent] = true

task :fix_setup_permissions do 
   run "#{try_sudo} chown -R #{user}:#{user} #{deploy_to}"
end 
after("deploy:setup", "fix_setup_permissions")

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
