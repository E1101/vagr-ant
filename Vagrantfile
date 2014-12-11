# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "base"
  config.vm.box_url = "https://vagrantcloud.com/pnaderi/boxes/centos7-lamp/versions/1/providers/virtualbox.box"

  ##### INDIVIDUALS ############################################################

  ## web ---------------------------------------------------------------------------
  config.vm.define "web" do |conf|
      # conf.vm.network "private_network", ip: "192.168.50.50"

      # Forward http port on 8080, used for connecting web browsers to localhost:8080
      conf.vm.network :forwarded_port, guest: 80, host: 8080
      # MariaDB 
      conf.vm.network :forwarded_port, guest: 3306, host: 33066

      # Set share folder permissions to 777 so that apache can write files
      conf.vm.synced_folder '.', '/var/www/html'
        #, mount_options: ['dmode=777','fmode=666']
      # Disable default vagrant folder
      conf.vm.synced_folder '.', '/vagrant', disabled: true

      # Provider-specific weburation so you can fine-tune VirtualBox for Vagrant.
      # These expose provider-specific options.
      conf.vm.provider :virtualbox do |vb|
        # Use VBoxManage to customize the VM. For example to change memory:

        # Set Provider Name
        vb.name = "vagrant_web"
        vb.customize ["modifyvm", :id, "--memory", "512"]
      end

      # conf.vm.provision "shell", path: "Vagrant.Provision.sh"
  end

  ## db ---------------------------------------------------------------------------
  #config.vm.define "db" do |db|
    # We'll fill this in soon.
  #end

  ##### GENERAL CONFIGS ############################################################

  # Forward MySql port on 33066, used for connecting admin-clients to localhost:33066
  # config.vm.network :forwarded_port, guest: 3306, host: 33066

  # config.vm.provision "shell", path: "Vagrant.Provision.sh"

end
