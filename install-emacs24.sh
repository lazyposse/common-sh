#!/bin/bash -xe

###############################################################################
#
# Install Emacs24 on a brand new Ubuntu system
#
###############################################################################

BASEDIR=$(dirname $0)

UBUNTU_VERSION=$("$BASEDIR"/ubuntu-version-name.sh)

if [ -z $UBUNTU_VERSION ]
then
  set +x;
  echo;
  echo "Sorry, can't find your ubuntu version name, exiting ...";
  echo;
  exit 1;
fi

sudo apt-get install python-software-properties

sudo add-apt-repository ppa:cassou/emacs

sudo tee -a /etc/apt/sources.list <<EOF

# For Emacs 24
deb http://ppa.launchpad.net/cassou/emacs/ubuntu $UBUNTU_VERSION main
deb-src http://ppa.launchpad.net/cassou/emacs/ubuntu $UBUNTU_VERSION main
EOF

sudo apt-get update

yes | sudo apt-get install emacs-snapshot

emacs --version

DST=~/.emacs.d/init.el
for I in '(require '\''package)'                                     \
         '(add-to-list '\''package-archives'                         \
         \''("marmalade" . "http://marmalade-repo.org/packages/") t)'\
         '(package-initialize)'
do 
    echo $I >> $DST;
done

emacs --batch -e package-refresh-contents

emacs --bach -e (package-install "starter-kit")
