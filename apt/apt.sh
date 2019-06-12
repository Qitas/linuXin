#!/bin/bash
export shellPath=`pwd`

if [ -f /etc/apt/sources.list ]; then
    sudo mv /etc/apt/sources.list  /etc/apt/sources.list.bak
fi
var=`lsb_release -c`
system_var=`echo ${var:9}`
echo $system_var

if [ -f $shellPath/src/bionic.list ]; then
    sudo cp $shellPath/src/bionic.list /etc/apt/sources.list
fi

sudo apt update
sudo apt upgrade -y
sudo apt install -y git