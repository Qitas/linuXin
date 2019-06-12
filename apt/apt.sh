#!/bin/bash
sudo mv /etc/apt/sources.list  /etc/apt/sources.list.bak
sudo cp ./src/sources.list /etc/apt/

sudo apt update
sudo apt upgrade -y
