#!/bin/bash
export shellPath=`pwd`

if [ -f /etc/apt/sources.list ]; then
    sudo mv /etc/apt/sources.list  /etc/apt/sources.list.bak
fi
if [ -f $shellPath/src/sources.list ]; then
    sudo cp $shellPath/src/sources.list /etc/apt/
fi

sudo apt update
sudo apt upgrade -y
sudo apt install -y git