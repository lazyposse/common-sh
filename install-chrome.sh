#!/bin/bash -xe

###############################################################################
#
# Install Google Chrome on a brand new Ubuntu system
#
###############################################################################

cd

wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb

sudo sed -i 's/^# deb \(.*\) multiverse/deb \1 multiverse/g' /etc/apt/sources.list

sudo apt-get update

sudo apt-get install gdebi

sudo gdebi google-chrome-stable_current_i386.deb

google-chrome



