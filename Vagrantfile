# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # you can replace box001 with another name
  config.vm.define 'hello_django' do |node|
    node.vm.provision 'ansible' do |ansible|
      # http://bertvv.github.io/vagrant-presentation/#/vagrant-configuration
      # "define directive is important to make automatic inventory work"
      # I wish I could comment out the following line to allow for
      #  .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
      # to be calculated w/o running any ansible playbook -- but no luck
      ansible.playbook = 'hello_django.yml'
    end
  end

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.11"
  # config.vm.synced_folder "data", "vagrant_data"

  # virtualbox
  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  
  config.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
  end

  config.vm.provider :aws do |aws, override|
    aws.access_key_id =  ENV['AWS_ACCESS_KEY_ID']
    aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    
    #aws.region = "us-east-1"
    #aws.region_config "us-east-1", :ami => "ami-7747d01e"
    
    #aws.session_token = ""
    aws.keypair_name = "ry-laptop"

    # Ubuntu 12.04 LTS Precise
    # PV EBS-SSD boot
    # alestic 2015.05.05
    
    aws.instance_type="t1.micro"
    
    aws.region = "us-east-1"
    aws.ami = "ami-d8132bb0"
    
 
    override.vm.box = "dummy"
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = "/Users/raymondyee/.ssh/id_rsa"
  end

end
