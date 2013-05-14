set_default(:unicorn_user) { user }
set_default(:unicorn_pid) { "#{current_path}/tmp/pids/unicorn.pid" }
set_default(:unicorn_config) { "#{shared_path}/config/unicorn.rb" }
set_default(:unicorn_log) { "#{shared_path}/log/unicorn.log" }
set_default(:unicorn_workers, 4)
namespace :unicorn do
  desc "Setup Unicorn initializer and app configuration"
  task :setup, roles: :app do
    run "#{sudo} mkdir -p #{shared_path}/config"
    template "unicorn.rb.erb", "/tmp/unicorn_conf" 
    run "#{sudo} mv /tmp/unicorn_conf #{unicorn_config}"
  end
  after "deploy:setup", "unicorn:setup"
end

namespace :deploy do
  task :start, :roles => :app do
    run "cd #{current_path}; bundle exec unicorn_rails -D -c #{unicorn_config} -E production"
  end

  task :stop, :roles => :app do
    run "kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    stop
    start
    # run "kill -USR2 `cat #{unicorn_pid}`"
  end
end