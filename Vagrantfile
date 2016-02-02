Vagrant.configure(2) do |config|
  config.vm.hostname = 'vagrant-vm-' + `whoami`.chomp.downcase
  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true
  config.vm.provision "shell", inline: "cd /vagrant && make vagrant_setup"
end
