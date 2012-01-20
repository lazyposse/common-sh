#!/bin/bash -e

set -x
git pull origin master
git fetch upstream
git merge upstream/master
git push origin master
set +x
echo "Everything OK!"

