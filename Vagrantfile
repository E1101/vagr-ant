# -*- mode: ruby -*-
# vi: set ft=ruby :

# ----------------------------------------------------------------------------------
# | - xdebug Enabled
# | Append ?XDEBUG_PROFILE=1 to start profiling
# | : to xdebug working enable port forward 9000 from guest(vagrant)
# |
# | - php conf
# | /etc/php5/apache2/php.ini
# |
# | - php log to shared vagrant folder
# | error_log = /vagrant/php_errors.log


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntuserver-lamp-devel"
  # config.vm.box_url = "https://vagrantcloud.com/pnaderi/boxes/centos7-lamp/versions/1/providers/virtualbox.box"

  ##### INDIVIDUALS ############################################################

  ## web ---------------------------------------------------------------------------
  config.vm.define "server" do |conf|
      # conf.vm.network "private_network", ip: "192.168.50.50"
      # conf.vm.network "public_network", ip: "192.168.50.10", type: "dhcp"
      
      # Forward http port on 8080, used for connecting web browsers to localhost:8080
      conf.vm.network :forwarded_port, guest: 80, host: 8080

      # XDebug
      conf.vm.network :forwarded_port, guest: 9000, host: 9000

      # MariaDB
      # conf.vm.network :forwarded_port, guest: 3306, host: 33066

      # Set share folder permissions to 777 so that apache can write files
      conf.vm.synced_folder './skeleton', '/var/www/html'
        #, mount_options: ['dmode=777','fmode=666']
      # Disable default vagrant folder
      conf.vm.synced_folder './data', '/vagrant'

      # Provider-specific weburation so you can fine-tune VirtualBox for Vagrant.
      # These expose provider-specific options.
      conf.vm.provider :virtualbox do |vb|
        # Use VBoxManage to customize the VM. For example to change memory:

        # Set Provider Name
        vb.name = "vagrant_server"
        vb.customize ["modifyvm", :id, "--memory", "512"]
		
	## Enable This If Having Truble Loggin
	#vb.gui = true
	
	## Enable Internet
	vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

    end

      #conf.vm.provision "shell", path: "Vagrant.Provision.sh"
      
      # get ip address of host
      conf.vm.provision "shell", inline: "ip addr | grep 'inet'"
  end

  ## db ---------------------------------------------------------------------------
  #config.vm.define "db" do |db|
    # We'll fill this in soon.
  #end

  ##### GENERAL CONFIGS ############################################################

  # Forward MySql port on 33066, used for connecting admin-clients to localhost:33066
  # config.vm.network :forwarded_port, guest: 3306, host: 33066

  #config.vm.provision "shell", path: "Vagrant.Provision.sh"

end
