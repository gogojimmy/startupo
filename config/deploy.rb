require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'capistrano_colors'

set :application, "startupo"
set :repository,  "git@github.com:gogojimmy/Startupo.cc.git"

set :scm, :git
set :deploy_via, :remote_cache
set :scm_verbose, true
set :use_sudo, false

set :stages, %(staging production)
set :default_stage, "staging"

default_run_options[:pty] = true

#set :whenever_command, "bundle exec whenever"
#set :whenever_environment, defer { stage }
#require "whenever/capistrano"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :custom_setup, :roles => [:app] do
    run "cp #{shared_path}/config/*.yml #{release_path}/config/"
  end

  #task :generate_yard, :roles => [:app] do
    #run "cd #{current_path} && yard"
    #run "rm -rf /home/staging/api/current/public/locomote"
    #run "mv #{current_path}/doc /home/staging/api/current/public/locomote"
  #end
end

task :tail_log, :roles => :app do
  run "tail -f #{shared_path}/log/#{rails_env}.log"
end

before "deploy:assets:precompile", "deploy:custom_setup"

after "deploy", "deploy:cleanup"
after "deploy", "deploy:generate_yard"

after "deploy:migrations", "deploy:cleanup"
after "deploy:migrations", "deploy:generate_yard"

