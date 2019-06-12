#!/bin/bash
shellPath=`pwd`

sudo mv /etc/apt/sources.list  /etc/apt/sources.list.bak
sudo cp $shellPath//src/sources.list /etc/apt/

sudo apt update
sudo apt upgrade -y
