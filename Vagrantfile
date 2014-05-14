# -*- mode: ruby -*-
# # vi: set ft=ruby :

NUM_INSTANCES         = 1
ENABLE_SERIAL_LOGGING = false
VB_GUI                = false
VB_MEMORY             = 1024
VB_CPUS               = 1
EXPOSE_DOCKER_TCP     = 4243
CLOUD_CONFIG_PATH     = "./user-data"

Vagrant.configure("2") do |config|
  config.vm.box = "coreos-alpha"
  config.vm.box_url = "http://storage.core-os.net/coreos/amd64-usr/alpha/coreos_production_vagrant.box"

  config.vm.provider :vmware_fusion do |vb, override|
    override.vm.box_url = "http://storage.core-os.net/coreos/amd64-usr/alpha/coreos_production_vagrant_vmware_fusion.json"
  end

  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  config.vm.define vm_name = "coreos-vagrant" do |coreos|
    coreos.vm.hostname = vm_name

    coreos.vm.network "forwarded_port", guest: 4243, host: EXPOSE_DOCKER_TCP, auto_correct: true

    coreos.vm.provider :virtualbox do |vb|
      vb.gui = VB_GUI
      vb.memory = VB_MEMORY
      vb.cpus = VB_CPUS
    end

    coreos.vm.network :private_network, ip: "10.10.9.8"

    # Uncomment below to enable NFS for sharing the host machine into the coreos-vagrant VM.
    config.vm.synced_folder "./data", "/home/core/share", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']

    config.vm.provision :file, :source => "#{CLOUD_CONFIG_PATH}", :destination => "/tmp/vagrantfile-user-data"
    config.vm.provision :shell, :inline => "mv /tmp/vagrantfile-user-data /var/lib/coreos-vagrant/", :privileged => true

    (49000..49900).each do |port|
      config.vm.network :forwarded_port, :host => port, :guest => port
    end
  end
end
