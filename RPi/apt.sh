#!/bin/bash
sudo mv /etc/pip.conf  /etc/pip.conf.origin
sudo mv /etc/apt/sources.list  /etc/apt/sources.list.origin

sudo cp ./pip.conf /etc/
sudo cp ./sources.list /etc/apt/

sudo apt update
sudo apt upgrade -y

#python3 install
sudo apt install python-dev python3-dev -y
sudo apt install python-pip python3-pip -y
sudo apt install libopencv-dev -y
sudo apt install build-essential python3-distlib python3-setuptools python3-wheel libzmq-dev libgdal-dev -y
