#!/bin/bash -e

###############################################################################
#
# Convert the given version of an Ubuntu to the corresponding version.
#
###############################################################################

#UBUNTU_VERSION_NUMBER=$(head -n1 /etc/issue | cut -f2 -d' ')

declare -A version

version[4.10]=warty
version[5.04]=hoary
version[5.10]=breezy
version[6.06]=dapper
version[6.10]=edgy
version[7.04]=feisty
version[7.10]=gutsy
version[8.04]=hardy
version[8.10]=interpid
version[9.04]=jaunty
version[9.10]=karmic
version[10.04]=lucid
version[10.10]=maverick
version[11.04]=natty
version[11.10]=oneiric
version[12.04]=precise

V_NUM=$(cat /etc/issue | cut -f2 -d' ')

echo ${version[$V_NUM]}

