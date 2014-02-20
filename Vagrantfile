# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "vendor/cold_start", "/home/vagrant/cold_start"
  config.vm.synced_folder "vendor/radiodan_server", "/home/vagrant/apps/radiodan_server"


  $script = <<SCRIPT
  echo "Backing up vagrant networking"
  sudo cp /etc/network/interfaces /etc/network/interfaces.vagrant-backup
  sudo /home/vagrant/cold_start/provision.sh --force-yes
  echo "Reinstating vagrant networking"
  sudo cp /etc/network/interfaces.vagrant-backup /etc/network/interfaces
  sudo cp /usr/local/bin/try_adhoc_network /usr/local/bin/try_adhoc_network.vagrant-backup
  sudo cp /dev/null /usr/local/bin/try_adhoc_network
  sudo usermod -G audio,sudo vagrant
SCRIPT

  config.vm.provision "shell", inline: $script
end
