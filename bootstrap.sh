#!/usr/bin/env bash
#!/bin/sh
sudo apt-add-repository -y ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get -y install fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

sudo apt-get -y install mc
