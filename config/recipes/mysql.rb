namespace :mysql do
  desc "Install latest stable release of mysql"
  task :install, roles: :web do
    run "#{sudo} yum -y install mysql mysql-server mysql-devel", :shell => :bash
    run "#{sudo} chkconfig mysqld on", :shell => :bash
    run "#{sudo} service mysqld start", :shell => :bash
  end
  after "deploy:install", "mysql:install"

  desc "Set password for mysql"
  task :setup do 
    set(:new_mysql_password) { Capistrano::CLI.password_prompt("New mysql password: ") }

    run "#{sudo} mysqladmin -uroot -p password '#{new_mysql_password}'",:pty => true do |ch, stream, data|
      smart_input(ch, stream, data)
    end
  end
  # after "deploy:setup", "mysql:setup"

end