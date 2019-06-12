#!/bin/bash

export shellPath=`pwd`

curl https://packages.gitlab.com/gpg.key 2> /dev/null | sudo apt-key add - &>/dev/null
sudo cp ./src/gitlab-ce.list /etc/apt/
sudo apt update
sudo apt install gitlab-ce -y

exit 0
