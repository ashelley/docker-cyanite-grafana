# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Cassandra node
  config.vm.define 'cassandra01' do |node|
    node.vm.provider "docker" do |d|
      d.has_ssh  = false
      d.build_dir = "./cassandra"
    end
  end

end
