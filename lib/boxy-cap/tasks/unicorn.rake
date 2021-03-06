namespace :unicorn do
  desc 'Restart the unicorn process'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
        if test("[ -f #{current_path.join('tmp/pids/unicorn.pid')} ]")
          execute :kill, "-s USR2 `cat #{current_path.join('tmp/pids/unicorn.pid')}`"
        else
          execute :sudo, :monit, "-g #{fetch(:monit_unicorn_name)} restart"
        end
    end
  end

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
