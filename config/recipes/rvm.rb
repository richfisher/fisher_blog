set :rvm_ruby_string, '1.9.3'  
set :rvm_type, :system             
set :rvm_autolibs_flag, :enable    
set :rvm_install_shell, :bash

namespace :rvm do 
	task :use_taobao_source do 
		run "sed -i 's!ftp.ruby-lang.org/pub/ruby!ruby.taobao.org/mirrors/ruby!' $rvm_path/config/db", :shell => :bash
	end
end
after 'rvm:install_rvm', 'rvm:use_taobao_source'

before 'deploy:setup', 'rvm:install_rvm'   
before 'deploy:setup', 'rvm:install_ruby'  
require "rvm/capistrano"