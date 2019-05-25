#!/bin/bash

export shellPath=`pwd`

curl https://packages.gitlab.com/gpg.key 2> /dev/null | sudo apt-key add - &>/dev/null
sudo cp ./src/gitlab-ce.list /etc/apt/
sudo apt-get update
sudo apt-get install gitlab-ce

echo "finish git config\n${Line}"

exit 0
