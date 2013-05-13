def smart_input(ch, stream, data)
  if data =~ /Press\sEnter\sto\scontinue/ || data =~ /Press\sENTER\sto\scontinue/
    ch.send_data( "\n")
  elsif data =~ /Enter|Press|ENTER|PRESS/
  	Capistrano::Configuration.default_io_proc.call( ch, stream, data)
  	ch.send_data(Capistrano::CLI.password_prompt("Enter or Press sth: ") + "\n")
  else
    Capistrano::Configuration.default_io_proc.call( ch, stream, data)
  end
end

def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do 
  task :install_epel do 
    run "#{sudo} rpm -Uvh --replacepkgs http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm", :shell => :bash
  end

  task :install do
    run "#{sudo} yum install -y curl git ImageMagick-devel", :shell => :bash
  end
end