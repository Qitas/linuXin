#!/bin/bash

shellPath=`pwd`

sudo yum install -y git 
ssh-keygen -t rsa -C qitas@qitas.cn
git config --global user.name qitas
git config --global user.email qitas@qitas.cn
git config --global alias.cc clone --depth=1
git config --global alias.ci commit -am 
git config --global alias.cr clone --recursive
git config --global alias.su submodule update --init

exit 0
