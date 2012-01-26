#!/bin/bash -xe

###############################################################################
#
# Install Emacs24 on a brand new Ubuntu system
#
###############################################################################

source /etc/lsb-release

BASEDIR=$(dirname $0)

if [ -z $DISTRIB_CODENAME ]
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
deb http://ppa.launchpad.net/cassou/emacs/ubuntu $DISTRIB_CODENAME main
deb-src http://ppa.launchpad.net/cassou/emacs/ubuntu $DISTRIB_CODENAME main
EOF

sudo apt-get update

yes | sudo apt-get install emacs-snapshot

emacs --version

EM_DIR=~/.emacs.d
EM_BAK="$EM_DIR""-"$(date +%F-%Hh%Mm%Ss)
if [ -e $EM_DIR ]
then
  set +x;
  echo;
  echo "$EM_DIR already exists !!! Looks like you already have an Emacs installation";
  echo;
  echo "    Do you want to archive $EM_DIR to $EM_BAK?";
  select YN in yes no;
  do 
      if [ $YN = "yes" ]; 
          then mv -v "$EM_DIR" "$EM_BAK"; break;
          else echo "Exiting..."        ; exit 1;
      fi
  done
  echo;
fi

mkdir $EM_DIR
tee "$EM_DIR"/init.el <<EOF
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-bindings clojure-mode midje-mode multi-term switch-window slime)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

EOF


