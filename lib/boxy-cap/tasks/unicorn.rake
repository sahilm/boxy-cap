namespace :unicorn do
  desc 'Restart the unicorn process'
  task :restart do |task, args|
    on roles(:app) do
      execute :sudo, :monit, "-g #{fetch(:monit_unicorn_name)} restart"
    end
  end
  after 'deploy:cleanup', 'unicorn:restart'

  desc 'Stop the unicorn process'
  task :stop do
    on roles(:app) do
      execute :sudo, :monit, "-g #{fetch(:monit_unicorn_name)} stop"
    end
  end

  desc 'Start the unicorn process'
  task :start do
    on roles(:app) do
      execute :sudo, :monit, "-g #{fetch(:monit_unicorn_name)} start"
    end
  end
end

namespace :load do
  task :defaults do
    set :monit_unicorn_name, "unicorn"
  end
end
