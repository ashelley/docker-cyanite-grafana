# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Cassandra node
  config.vm.define 'cassandra01' do |node|
    node.vm.provider "docker" do |d|
      d.name      = "cass01"
      d.has_ssh   = false
      d.build_dir = "./cassandra"
    end
  end

  # ElasticSearch node
  config.vm.define 'elasticsearch01' do |node|
    node.vm.provider "docker" do |d|
      d.name      = "es01"
      d.has_ssh   = false
      d.build_dir = "./elasticsearch"
      d.ports = [ "9200:9200", "9300:9300" ]
    end
  end

  # Cyanite node
  config.vm.define 'cyanite01' do |node|
    node.vm.provider "docker" do |d|
      d.name      = "cyanite01"
      d.has_ssh   = false
      d.build_dir = "./cyanite"
      d.ports     = [ "2003:2003" ]
      d.link("cass01:cass01")
    end
  end

  # Graphite node
  config.vm.define 'graphite01' do |node|
    node.vm.provider "docker" do |d|
      d.name      = "graphite01"
      d.has_ssh   = false
      d.build_dir = "./graphite_api"
      d.ports     = [ "8000:8000", "80:80" ]
      d.link("cyanite01:cyanite01")
    end
  end

end
