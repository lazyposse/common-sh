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
  echo "Usage: $(basename $0) <ubuntu_version_name_(ex:oniric)>";
  echo;