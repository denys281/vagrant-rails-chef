# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder '.', '/vagrant', nfs: true


  config.vm.provider "virtualbox" do |v|
    host = RbConfig::CONFIG['host_os']

    # Give VM 1/4 system memory & access to all cpu cores on the host
    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    else # sorry Windows folks, I can't help you
      cpus = 2
      mem = 1024
    end

    v.customize ["modifyvm", :id, "--memory", mem]
    v.customize ["modifyvm", :id, "--cpus", cpus]
  end

  config.vm.provision :shell, :path => "bootstrap.sh", :privileged => false


  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  config.vm.provision "chef_solo" do |chef|

    chef.cookbooks_path = 'cookbooks'
    chef.log_level      = :debug
    chef.add_recipe :apt

    chef.add_recipe 'build-essential'
    chef.add_recipe 'networking_basic'
    chef.add_recipe 'openssl'

    chef.add_recipe 'git'

    chef.add_recipe 'sqlite'
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'postgresql::contrib'
    chef.add_recipe 'nodejs'

    chef.add_recipe 'tmux'
    chef.add_recipe 'rvm::system'
    chef.add_recipe 'rvm::vagrant'
    chef.add_recipe 'vim'
    chef.add_recipe 'chef_keys'
    chef.add_recipe 'imagemagick'

    chef.add_recipe 'chef-solo-search'
    # You may also specify custom JSON attributes:
    chef.json = {
      :rvm => {
        rubies: %w(ruby-2.2.0 ruby-2.1.4),
        default_ruby: 'ruby-2.2.0',
        vagrant: { system_chef_solo: "/opt/chef/bin/chef-solo" }
      },
      :git => {
        :prefix => true
      },
      "ssh_keys"=> {
        "username"=> 'vagrant',
        "usergroup"=> 'vagrant',
        "userhomedir"=> "/home/vagrant",
        "id_rsa"=> "private key goes here",
        "id_rsa.pub"=> "public key goes here"
      },
      :postgresql => {
        :config   => {
          :listen_addresses => "*",
          :port             => "5432"
        },
        :pg_hba   => [
          {
            :type   => "local",
            :db     => "postgres",
            :user   => "postgres",
            :addr   => nil,
            :method => "trust"
          },
          {
            :type   => "host",
            :db     => "all",
            :user   => "all",
            :addr   => "0.0.0.0/0",
            :method => "md5"
          },
          {
            :type   => "host",
            :db     => "all",
            :user   => "all",
            :addr   => "::1/0",
            :method => "md5"
          },
          {
            :type   => "host",
            :db     => "all",
            :user   => "all",
            :addr   => "192.168.33.10/0",
            :method => "md5"
          }
        ],
        :password => {
          :postgres => "postgres"
        }
      },
      :vim        => {
        :extra_packages => [
          "vim-rails"
        ]
      }
    }


  end



end
