#!/bin/bash
export shellPath=`pwd`

if [ -f /etc/apt/sources.list ]; then
    sudo mv /etc/apt/sources.list  /etc/apt/sources.list.bak
fi

var=`lsb_release -c`
system_var=`echo ${var:9}`

if [ -f $shellPath/src/$system_var.list ]; then
    sudo cp $shellPath/src/$system_var.list /etc/apt/sources.list
fi

sudo apt update
sudo apt upgrade -y
sudo apt install -y git