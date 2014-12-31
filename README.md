#Vagrant-rails chef

Ubuntu 14.04 install aimed for Ruby on Rails development.

This box (with chef provisioner) start with a basic Ubuntu 14.04 (trusty) based on ubuntu/trusty64 and it adds the following packages aimed for rails development:

- rvm
- ruby 2.1.4 and 2.2.0
- Git 1.9.1
- Postgresql 9.5 and SQLite
- Node.js
- ImageMagick

----------


## Installation
####This setup is based and tested with Ubuntu Trusty 64 bit base box, with Vagrant 1.7.0 version and VirtualBox 4.3.20.

* Install Vagrant using using the [installation instructions](http://docs.vagrantup.com/v2/installation/index.html)

* If you are on Windows OS install NFS support plugin [more information and detailed installation instructions](https://github.com/GM-Alex/vagrant-winnfsd):
```vagrant plugin install vagrant-winnfsd```

* Clone this repository

```$ git clone https://github.com/denys281/vagrant-rails.git```

* Install librarian-chef gem

```$ gem install librarian-chef```

* Install cookbooks

```$ librarian-chef install```

* run vagrant (for the first time it should take up to 10-15 min)
```$ vagrant up```

* Web server is accessible with http://192.168.33.10 (IP address can be changed in Vagrantfile)

* Vagrant automatically create user for Postgres :

**Postgres:**
* Username: postgres
* Password: postgres

----------


Vagrant use 1/4 system memory & access to all cpu cores on the host


----------

f
If needed, you can customize `config.vm.provision` script according to your app specifics, in such case just run `vagrant provision` in order to reload all scripts.

You can run `vagrant -h` to see some handy vagrant commands
