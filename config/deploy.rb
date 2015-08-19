set :application, 'mammamia'

set :repo_url, 'git@github.com:graykara/mammamia.git'

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :use_sudo, false
set :bundle_binstubs, nil

set :linked_files, fetch(:linked_files, []).push('configq/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:reload'
  end
end

# set :application, 'my_app_name'
# set :repo_url, 'git@example.com:me/my_repo.git'
#
# # ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
#
# # set :deploy_to, '/var/www/my_app'
# # set :scm, :git
#
# # set :format, :pretty
# # set :log_level, :debug
# # set :pty, true
#
# # set :linked_files, %w{config/database.yml}
# # set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
#
# # set :default_env, { path: "/opt/ruby/bin:$PATH" }
# # set :keep_releases, 5
#
# namespace :deploy do
#
#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       # execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end
#
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
#
#   after :finishing, 'deploy:cleanup'
#
# end
