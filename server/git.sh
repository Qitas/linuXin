#!/bin/bash

shellPath=`pwd`

sudo apt install git -y

git config --global user.name qitas
git config --global user.email qitas@qitas.cn
git config --global alias.cc clone --depth=1
git config --global alias.ci commit -am 


exit 0
