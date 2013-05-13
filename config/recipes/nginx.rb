namespace :nginx do
  desc "Install latest stable release of nginx"
  task :install, roles: :web do
    run "#{sudo} yum -y install nginx", :shell => :bash
    run "#{sudo} chkconfig nginx on", :shell => :bash
  end
  after "deploy:install", "nginx:install"

  desc "Setup nginx configuration for this application"
  task :setup, roles: :web do
    template "nginx.conf.erb", "/tmp/nginx_conf"
    run "#{sudo} mv /tmp/nginx_conf /etc/nginx/conf.d/#{application}.conf"
    run "#{sudo} rm -f /etc/nginx/conf.d/default.conf"
    restart
    run "#{sudo} mkdir -p /var/www"
  end
  after "deploy:setup", "nginx:setup"
  
  %w[start stop restart].each do |command|
    desc "#{command} nginx"
    task command, roles: :web do
      run "#{sudo} service nginx #{command}"
    end
  end
end