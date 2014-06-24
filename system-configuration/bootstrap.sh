#!/usr/bin/env bash

VAGRANT_FOLDER='/vagrant'
PROJECT_FOLDER='/project'

sudo ln -s $VAGRANT_FOLDER $PROJECT_FOLDER

sudo apt-get update -y
sudo apt-get install -y python-software-properties

# add apt repositor for ruby
sudo add-apt-repository -y ppa:brightbox/ruby-ng
sudo apt-get update -y

# automatic installation of security-upgrades
# this is very slow, we are trying to figure out a better way to do this
# unattended-upgrades

$PROJECT_FOLDER/od4d/bootstrap.sh
$PROJECT_FOLDER/rss-converter/bootstrap.sh
$PROJECT_FOLDER/semantic-repo/bootstrap.sh

# remove uneeded packages
sudo apt-get autoremove
