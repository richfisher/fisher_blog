namespace :redis do
  desc "Install latest stable release of redis"
  task :install, roles: :web do
    run "#{sudo} yum -y --enablerepo=epel install redis", :shell => :bash
    run "#{sudo} chkconfig redis on", :shell => :bash
    run "#{sudo} service redis restart", :shell => :bash
  end
  after "deploy:install", "redis:install"
end