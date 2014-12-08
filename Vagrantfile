# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.network "private_network", ip: "192.168.33.10"


  config.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "2048"]
  end



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

    chef.add_recipe 'nodejs'

    chef.add_recipe 'tmux'
    chef.add_recipe 'rvm::vagrant'
    chef.add_recipe 'rvm::system'
    chef.add_recipe 'vim'

#    chef.add_recipe  'zsh'
 #   chef.add_recipe  'oh-my-zsh' 

    # You may also specify custom JSON attributes:
    chef.json = {
      :rvm => {
         rubies: %w(ruby-2.1.4 ruby-2.1.5)
      },
      :git        => {
        :prefix => true
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
