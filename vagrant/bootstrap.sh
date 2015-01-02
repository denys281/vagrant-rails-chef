#!/usr/bin/env bash
#!/bin/sh
sudo apt-add-repository -y ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get -y install fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

#ImageMagick
sudo apt-get install -y imagemagick libmagickwand-dev

sudo apt-get -y install mc

git clone https://github.com/braintreeps/vim_dotfiles.git
cd vim_dotfiles
rake activate

# cleanup
sudo apt-get clean
