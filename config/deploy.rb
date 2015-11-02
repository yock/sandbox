# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'Sandbox'
set :repo_url, 'git@github.com:yock/sandbox.git'
set :deploy_to, '/var/www/html/sandbox.sparkboxqa.com'

