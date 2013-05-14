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

    set(:new_db_name) { Capistrano::CLI.password_prompt("New db name: ") }
    create_sql = <<-SQL
      CREATE DATABASE #{new_db_name};
    SQL

    run "mysql --user=root --password='#{new_mysql_password}' --execute=\"#{create_sql}\""
  end
  # after "deploy:setup", "mysql:setup"

end