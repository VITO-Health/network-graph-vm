# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "westlife-eu/openmodelica1.25"
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    vb.memory = "8592"
    vb.cpus = 6
  end
  config.vm.provision "shell", path: "./bootstrap_sw.sh"
  config.vm.provision "shell", path: "./bootstrap_httpd.sh"      
end
