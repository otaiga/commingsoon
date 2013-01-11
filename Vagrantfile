# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.ssh.max_tries = 50
  config.ssh.timeout = 300
  config.vm.customize ["modifyvm", :id, "--name", "comingsoon", "--memory", "512"]
  config.vm.box = "precise64_pre_puppet"
  config.vm.host_name = "comingsoon"
  config.vm.forward_port 22, 2222, :auto => true
  config.vm.forward_port 80, 8083
  config.vm.network :hostonly, "33.33.0.3"
  #config.vm.share_folder "puppet", "$HOME/provision", "./config/provision/"
end