require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'capistrano_colors'
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"

set :rvm_ruby_string, 'ruby-1.9.3-p125'
set :rvm_type, :user

set :application, "startupo"
set :repository,  "git@github.com:gogojimmy/startupo.git"

set :scm, :git
set :deploy_via, :remote_cache
set :scm_verbose, true
set :use_sudo, false

set :stages, %(staging production)
set :default_stage, "staging"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :custom_setup, :roles => [:app] do
    run "cp #{shared_path}/config/*.yml #{release_path}/config/"
  end

end

task :tail_log, :roles => :app do
  run "tail -f #{shared_path}/log/#{rails_env}.log"
end

before "deploy:assets:precompile", "deploy:custom_setup"
before 'deploy:setup', 'rvm:install_rvm'

after "deploy", "deploy:cleanup"

after "deploy:migrations", "deploy:cleanup"
after "deploy:migrations", "deploy:generate_yard"
