set :rails_env, "staging"
set :user, "staging"
set :domain, "staging.startupo.cc"
set :branch, "develop"

server "#{domain}", :web, :app, :db, :primary => true
set :deploy_to, "/home/#{user}/#{application}"
