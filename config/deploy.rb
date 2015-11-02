# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'Sandbox'
set :repo_url, 'git@github.com:yock/sandbox.git'
set :deploy_to, '/var/www/html/sandbox.sparkboxqa.com'

set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :rake, 'cache:clear'
        execute :touch, 'tmp/restart.txt'
      end
    end
  end

end
