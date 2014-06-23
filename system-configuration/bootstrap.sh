#!/usr/bin/env bash

VAGRANT_FOLDER='/vagrant'
PROJECT_FOLDER='/project'

apt-get update -y
apt-get install -y python-software-properties

# add apt repositor for ruby 2.1
add-apt-repository -y ppa:brightbox/ruby-ng
apt-get update -y

# automatic installation of security-upgrades
# this is very slow, we are trying to figure out a better way to do this
# unattended-upgrades

apt-get install -y vim curl git
apt-get install -y build-essential nodejs

apt-get remove -y openjdk-6-jre
apt-get install -y openjdk-7-jre

apt-get remove -y ruby1.9 ruby1.9.1
apt-get install -y ruby2.1 ruby2.1-dev rubygems

# for rails
apt-get install -y libsqlite3-dev

# remove uneeded packages
apt-get autoremove

gem install bundle

ln -s $VAGRANT_FOLDER $PROJECT_FOLDER
