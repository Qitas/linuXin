#!/bin/bash
shellPath=`pwd`

sudo add-apt-repository --yes ppa:js-reynaud/kicad-5.1
sudo apt update
sudo apt install -y --install-suggests kicad
