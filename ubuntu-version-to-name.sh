#!/bin/bash -xe

###############################################################################
#
# Convert the given version of an Ubuntu to the corresponding version.
#
###############################################################################

#UBUNTU_VERSION_NUMBER=$(head -n1 /etc/issue | cut -f2 -d' ')

if [ ! $# -eq 0 ]
then
    echo;
    echo "Usage: $(basename $0) <ubuntu-version-number>";
    echo;
    exit 1;
fi

UBUNTU_VERSION_NUMBER=$1

function ver2name {

    case $UBUNTU_VERSION_NUMBER in 
        '10.04')
            UBUNTU_VERSION_NAME=''
            ;;
        '10.10')
            UBUNTU_VERSION_NAME=''
            ;;
        '11.04')
            UBUNTU_VERSION_NAME=''
            ;;
        '11.10')
            UBUNTU_VERSION_NAME=''
            ;;
        '*')
            echo;
            echo "Unknown version ";
            echo;
            ;;
    esac

}
