# -*- mode: ruby -*-
# vi: set ft=ruby :

# http://simplesideias.com.br/usando-o-vagrant-como-ambiente-de-desenvolvimento-no-windows
# https://github.com/rickfarmer/android-vm

VAGRANTFILE_API_VERSION = "2"
MACHINE_NAME = "mongodb-server"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"
  
  # Definição do nome da VM
  config.vm.host_name = MACHINE_NAME
  
  # Mapeamento da porta 27017 (MongoDB)
  config.vm.network :forwarded_port, guest: 27017, host: 27017
  
  # Habilitado a verificação automática de atualizações
  config.vm.box_check_update = true
  
  config.vm.define :mongodb do |mongodb_config|
    # Definição de IP fixo para a VM
    mongodb_config.vm.network :private_network, :ip => "192.168.33.2"
  end 
  
  config.vm.provider "virtualbox" do |v|
    v.name = MACHINE_NAME
    
    # Sem interface gráfica
    v.gui = false
    
    # Definição da alocação máxima de memória para a VM
    v.customize ["modifyvm", :id, "--memory", "1024"]
    
    # Definição de uso de CPU do host para 50% para VM
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    
    # Opção de performance recomendadas pelas documentações do VirtualBox
    v.customize [
      "setextradata", :id,
      "VBoxInternal/Devices/ahci/0/LUN#[0]/Config/IgnoreFlush", "1"
    ]
  end
  
  config.vm.provision "shell", inline: "echo Running provision script..."
  config.vm.provision "shell", path: "provision.sh"
  config.vm.provision "shell", inline: "echo Provision script execution complete"
  
  config.vm.synced_folder "./", "/vagrant", owner: 'vagrant', group: 'vagrant'
  
  # https://coderwall.com/p/qtbi5a
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
end