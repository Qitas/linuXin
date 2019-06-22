#!/bin/bash
shellPath=`pwd`

# kicad pcb tools
sudo apt-get remove -y kicad kicad-footprints kicad-libraries
sudo apt-get remove -y kicad-symbols kicad-templates  kicad-packages3d
sudo apt-get remove -y kicad-doc-* kicad-locale-*

sudo add-apt-repository -r ppa:js-reynaud/ppa-kicad

sudo add-apt-repository --yes ppa:js-reynaud/kicad-5
sudo apt update
#sudo apt install kicad
sudo apt install -y --install-suggests kicad
