#!/bin/bash -xe

###############################################################################
#
# Install Emacs24 on a brand new Ubuntu system
#
###############################################################################

UBUNTU_VERSION=$1

if [ -z $UBUNTU_VERSION ]
then
  set +x;
  echo;
  echo "Usage: $(basename $0) <ubuntu_version_name_(ex:oniric)>";
  echo;
fi

sudo apt-get install python-software-properties

sudo add-apt-repository ppa:cassou/emacs

SRC=/etc/apt/sources.list

sudo echo                                                                               >> $SRC
sudo echo "# For emacs 24"                                                              >> $SRC
sudo echo "deb http://ppa.launchpad.net/cassou/emacs/ubuntu $UBUNTU_VERSION main "      >> $SRC
sudo echo "deb-src http://ppa.launchpad.net/cassou/emacs/ubuntu $UBUNTU_VERSION main "  >> $SRC

sudo apt-get update

sudo apt-get install emacs-snapshot

emacs --version