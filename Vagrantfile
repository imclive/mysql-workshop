VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.7.2"

# expose ports from guest to host for convenience
FORWARDED_PORT_RANGE = 3301..3310

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.define "main", primary: true do |node|
	
        node.vm.box = "bento/centos-7.1"
        node.vm.box_version = ">= 1.4.1.3"

        node.vm.network "private_network", ip: "192.168.56.15"
		node.vm.network "forwarded_port", guest: 80, host: 3380
        for i in FORWARDED_PORT_RANGE
            node.vm.network "forwarded_port", guest: i, host: i
        end
		
        node.vm.provision "hosts" do |hosts|			
            hosts.add_host '192.168.56.15', ['dindin.com', 'main']
			hosts.add_host '192.168.56.10', ['dindin.com', 'node0']
			hosts.add_host '192.168.56.11', ['dindin.com', 'node1']
			hosts.add_host '192.168.56.12', ['dindin.com', 'node2']
        end		
		
        node.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "1024"]
        end
		node.vm.provision "shell", path: "provision/update.sh"
    end
	
    config.vm.define "node0" do |node|

        node.vm.box = "bento/centos-7.1"
        node.vm.box_version = ">= 1.4.1.3"
		
		node.vm.network "private_network", ip: "192.168.56.10"		
        node.vm.provision "hosts" do |hosts|
            hosts.add_host '192.168.56.15', ['dindin.com', 'main']
			hosts.add_host '192.168.56.10', ['dindin.com', 'node0']
			hosts.add_host '192.168.56.11', ['dindin.com', 'node1']
			hosts.add_host '192.168.56.12', ['dindin.com', 'node2']
        end		
		
        node.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "1024"]
        end
		
        #node.vm.provision "shell", path: "provision/setup-docker-tools.sh"
        node.vm.provision "shell", path: "provision/setup-env.sh"
		# config.vm.provision "shell", inline: <<-SHELL
		#   sudo apt-get update
		#   sudo apt-get install -y apache2
		# SHELL
    end


    config.vm.define "node1" do |node|

        node.vm.box = "bento/centos-7.1"
        node.vm.box_version = ">= 1.4.1.3"

        node.vm.network "private_network", ip: "192.168.56.11"
        node.vm.provision "hosts" do |hosts|
            hosts.add_host '192.168.56.15', ['dindin.com', 'main']
			hosts.add_host '192.168.56.10', ['dindin.com', 'node0']
			hosts.add_host '192.168.56.11', ['dindin.com', 'node1']
			hosts.add_host '192.168.56.12', ['dindin.com', 'node2']
        end		
		
        node.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "1024"]
        end
		node.vm.provision "shell", path: "provision/setup-env.sh"
    end


    config.vm.define "node2" do |node|
        node.vm.box = "bento/centos-7.1"
        node.vm.box_version = ">= 1.4.1.3"

        node.vm.network "private_network", ip: "192.168.56.12"
        node.vm.provision "hosts" do |hosts|
            hosts.add_host '192.168.56.15', ['dindin.com', 'main']
			hosts.add_host '192.168.56.10', ['dindin.com', 'node0']
			hosts.add_host '192.168.56.11', ['dindin.com', 'node1']
			hosts.add_host '192.168.56.12', ['dindin.com', 'node2']
        end		
		
        node.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "1024"]
        end
		node.vm.provision "shell", path: "provision/setup-env.sh"
    end


end
