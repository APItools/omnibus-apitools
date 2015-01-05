# -*- mode: ruby -*-
# vi: set ft=ruby :

# This vagrant config is for testing generated packages

Vagrant.configure('2') do |config|
  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
    v.cpus = 1
  end

  config.vm.define 'trusty' do |trusty|
    trusty.vm.box = 'ubuntu/trusty64'
  end
end
