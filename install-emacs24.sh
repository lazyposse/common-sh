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
  exit 1;
fi

sudo apt-get install python-software-properties

sudo add-apt-repository ppa:cassou/emacs

SRC=/etc/apt/sources.list

for I in ""                                                                            \
         "# For emacs 24"                                                              \
         "deb http://ppa.launchpad.net/cassou/emacs/ubuntu $UBUNTU_VERSION main "      \
         "deb-src http://ppa.launchpad.net/cassou/emacs/ubuntu $UBUNTU_VERSION main "
do 
  sudo bash -c "echo $I >> $SRC"
done

sudo apt-get update

yes | sudo apt-get install emacs-snapshot

emacs --version

emacs -e package-refresh-contents

emacs -e (package-install "starter-kit")