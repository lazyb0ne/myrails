# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "myrails"
set :repo_url, "git@github.com:lazyb0ne/myrails.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/www/rails/myrails"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# set :scm, :git

# set :default_env, {
#     :PATH => '/usr/share/rvm/bin/rvm'
# }

set :branch, :master
set :user, 'www'

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml", "config/puma.rb", "config/application.yml", "config/.env"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", 'vendor/bundle', 'public/uploads'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
#
# namespace :deploy do
#   after :publishing, :restart
#
#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end
#
# end

# If the environment differs from the stage name
set :rails_env, 'production'

# Defaults to :db role
set :migration_role, :db

# Defaults to the primary :db server
set :migration_servers, -> { primary(fetch(:migration_role)) }

# # Defaults to false
# # Skip migration if files in db/migrate were not modified
# set :conditionally_migrate, true
#
# # Defaults to [:web]
# set :assets_roles, [:web, :app]
#
# # Defaults to 'assets'
# # This should match config.assets.prefix in your rails config/application.rb
# set :assets_prefix, 'prepackaged-assets'
#
# # RAILS_GROUPS env value for the assets:precompile task. Default to nil.
# set :rails_assets_groups, :assets
#
# # If you need to touch public/images, public/javascripts, and public/stylesheets on each deploy
# set :normalize_asset_timestamps, %w{public/images public/javascripts public/stylesheets}
#
# # Defaults to nil (no asset cleanup is performed)
# # If you use Rails 4+ and you'd like to clean up old assets after each deploy,
# # set this to the number of versions to keep
# set :keep_assets, 2
#
# set :migration_role, :app


# namespace :deploy do
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
# end
